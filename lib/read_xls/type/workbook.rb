module ReadXls
  module Type
    class Workbook
      attr_accessor :worksheets

      def initialize
        self.worksheets = []
      end

      def add_worksheet(worksheet)
        worksheets << worksheet
      end
    end
  end
end