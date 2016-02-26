module ReadXls
  class WorksheetBuilder
    attr_accessor :rows, :sst

    def initialize
      self.rows = {}
    end

    def add_row(row_index, row)
      rows[row_index] = row
    end

    def add_column_to_row(row_index, column_index, value)
      row = rows[row_index] || raise("could not find row")
      row.add_column(column_index, value)
    end

    def build
      evaluated_rows = rows.values.map { |r| r.evaluate }
      ::ReadXls::Type::Worksheet.new(:rows => evaluated_rows)
    end
  end
end