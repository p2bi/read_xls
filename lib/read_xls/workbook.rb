module ReadXls
  class Workbook
    attr_accessor :worksheets, :formats, :extended_formats

    def initialize
      self.worksheets       = []
      self.formats          = []
      self.extended_formats = []
    end
  end
end