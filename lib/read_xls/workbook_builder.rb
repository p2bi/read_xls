module ReadXls
  class WorkbookBuilder
    attr_accessor :biff, :worksheet_builders, :sst

    def initialize(biff)
      self.biff               = biff
      self.worksheet_builders = []
    end

    def add_worksheet_builder(worksheet_builder)
      self.worksheet_builders << worksheet_builder
    end

    def build
      workbook            = ::ReadXls::Workbook.new
      workbook.worksheets = build_worksheets
      workbook
    end


    def build_worksheets
      worksheet_builders.map do |worksheet_builder|
        raise "no sst found!" if sst.nil?
        worksheet_builder.sst = sst
        worksheet_builder.build
      end
    end
  end
end