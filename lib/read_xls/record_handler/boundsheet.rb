module ReadXls
  module RecordHandler
    class Boundsheet < ::ReadXls::RecordHandler::Base
      attr_accessor :position

      def call
        worksheet_builder = ::ReadXls::Workbook::WorksheetBuilder.new
        offset            = record_data.unpack("v").first
        self.position     = offset

        loop do
          record_number = read_byte
          break if record_number == ::ReadXls::RecordHandler::EOF

          record_length = read_byte
          record_data   = read_data(record_length)

          ::ReadXls::RecordHandler.call(
            record_number,
            worksheet_builder,
            biff,
            record_data
          )
        end

        builder.add_worksheet_builder(worksheet_builder)
      end

      def read_data(bytes)
        val           = biff.byteslice(position, bytes)
        self.position += bytes
        val
      end


      def read_byte
        val           = biff.byteslice(position, 2).unpack("v")
        self.position += 2
        val.first || raise(ParsingFailedError, "expected to get value, got nil")
      end
    end
  end
end