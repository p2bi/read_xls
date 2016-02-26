module ReadXls
  class WorkbookBuilder
    attr_accessor :biff, :worksheets

    def initialize(biff)
      self.biff       = biff
      self.worksheets = []
    end

    def add_worksheet(worksheet)
      self.worksheets << worksheet
    end

    def build
      workbook            = ::ReadXls::Type::Workbook.new(

      )
      workbook.worksheets = worksheets
      workbook
    end
  end
end