module ReadXls
  class Workbook
    class Row
      attr_accessor :row_number, :first_col, :last_col, :columns

      def initialize(row_number, first_col, last_col)
        self.row_number = row_number
        self.first_col  = first_col
        self.last_col   = last_col
        self.columns    = []
      end

      def add_column(column_index, value)
        columns[column_index] = value
      end

      def evaluate
        columns.each_with_index.each do |_, column_index|
          columns[column_index] ||= ::ReadXls::Column::Blank.new
        end

        columns.map { |c| c.evaluate }
      end
    end
  end
end