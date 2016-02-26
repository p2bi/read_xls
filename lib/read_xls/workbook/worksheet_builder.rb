module ReadXls
  class Workbook
    class WorksheetBuilder
      attr_accessor :rows, :sst

      def initialize
        self.rows = []
      end

      def add_row(row_index, row)
        rows[row_index] = row
      end

      def add_column_to_row(row_index, column_index, value)
        row = rows[row_index] || raise("could not find row")
        row.add_column(column_index, value)
      end

      def build
        evaluated_rows = build_rows
        ::ReadXls::Workbook::Worksheet.new(:rows => evaluated_rows)
      end


      private

      def build_rows
        rows.each_with_index.each do |_, row_index|
          rows[row_index] ||= ::ReadXls::Workbook::Row.new(row_index, 0, 0)
        end

        rows.map { |r| r.evaluate }
      end
    end
  end
end