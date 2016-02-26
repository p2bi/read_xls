module ReadXls
  module RecordHandler
    class Boundsheet < ::ReadXls::RecordHandler::Base
      BYTE_LENGTH = 2

      attr_accessor :position

      def call
        worksheet_builder = WorksheetBuilder.new
        offset            = record_data.unpack("v").first
        self.position     = offset

        loop do
          record_number = read_byte
          break if record_number == ::ReadXls::RecordHandler::EOF

          record_length = read_byte
          record_data   = read_data(record_length)

          ::ReadXls::RecordHandler
            .for(record_number)
            .call(worksheet_builder, biff, record_number.to_s(16), record_data)
        end

        builder.add_worksheet(worksheet_builder.build)
      end

      def read_data(bytes)
        val           = biff[position, bytes]
        self.position += bytes
        val
      end


      def read_byte
        val           = biff[position, BYTE_LENGTH].unpack("v")
        self.position += BYTE_LENGTH
        val.first || raise(ParsingFailedError, "expected to get value, got nil")
      end
    end
  end
end