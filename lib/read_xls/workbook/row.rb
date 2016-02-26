module ReadXls
  class Workbook
    class Row
      attr_accessor :row_number, :first_col, :last_col, :raw_columns

      def initialize(row_number, first_col, last_col)
        self.row_number  = row_number
        self.first_col   = first_col
        self.last_col    = last_col
        self.raw_columns = {}
      end

      def add_column(column_index, value)
        raw_columns[column_index] = value
      end

      def evaluate
        raw_columns.values.map { |column| column.evaluate }
      end
    end
  end
end