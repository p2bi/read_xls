module ReadXls
  module RecordHandler
    class Row < ::ReadXls::RecordHandler::Base
      def call
        row_number, first_col, last_col = record_data.unpack("v3")
        builder.add_row(row_number, ::ReadXls::Evaluator::Row.new(row_number, first_col, last_col))
      end
    end
  end
end