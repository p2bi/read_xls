module ReadXls
  class Spreadsheet
    attr_accessor :biff, :position, :workbook

    ParsingFailedError = Class.new(StandardError)

    def self.parse(xls_file_path)
      new(
        Ole::Storage.open(xls_file_path, "rb")
      )
    end

    def initialize(ole)
      self.position = 0
      self.biff     = ole.file.read("Workbook")
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
        record_number = read_word
        break if record_number == ::ReadXls::RecordHandler::EOF

        record_length = read_word
        record_data   = read_data(record_length)

        ::ReadXls::RecordHandler.call(
          record_number,
          workbook_builder,
          biff,
          record_data
        )
      end

      workbook_builder.build
    end

    def read_data(bytes)
      val           = biff.byteslice(position, bytes)
      self.position += bytes
      val
    end

    def read_word
      val           = biff.byteslice(position, 2).unpack("v")
      self.position += 2
      val.first || raise(ParsingFailedError, "expected to get value, got nil")
    end
  end
end