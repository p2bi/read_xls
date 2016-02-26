module ReadXls
  class Spreadsheet
    ParsingFailedError = Class.new(StandardError)
    BYTE_LENGTH        = 2

    attr_accessor :biff, :position, :workbook

    def self.parse(xls_file_path)
      new(
        Ole::Storage.open(xls_file_path, "rb+")
      )
    end

    def initialize(ole)
      self.position  = 0
      self.biff      = ole.file.read("Workbook")
      self.workbook = parse_workbook
    ensure
      ole.close
    end

    def sheets
      workbook.worksheets
    end

    def parse_workbook
      workbook_builder = WorkbookBuilder.new(biff)

      loop do
        record_number = read_byte
        break if record_number == ::ReadXls::RecordHandler::EOF

        record_length = read_byte
        record_data   = read_data(record_length)

        ::ReadXls::RecordHandler
          .for(record_number)
          .call(workbook_builder, biff, record_number.to_s(16), record_data)
      end

      workbook_builder.build
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