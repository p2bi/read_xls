module ReadXls
  class Workbook
    class WorksheetBuilder
      attr_accessor :rows, :formula_strings, :sst, :formats, :extended_formats

      def initialize
        self.rows            = []
        self.formula_strings = []
      end

      def add_row(row_index, row)
        rows[row_index] = row
      end

      def add_column_to_row(row_index, column_index, value)
        row = rows[row_index] || raise("could not find row")
        row.add_column(column_index, value)
      end

      def add_formula_string(string)
        self.formula_strings.push(string)
      end

      def build
        ::ReadXls::Workbook::Worksheet.new(:rows => build_rows)
      end

      def next_formula_string!
        self.formula_strings.shift
      end


      private

      def build_rows
        rows.each_with_index.each do |_, row_index|
          rows[row_index] ||= ::ReadXls::Evaluator::Row.new(row_index, 0, 0)
        end

        rows.map(&:evaluate)
      end
    end
  end
end