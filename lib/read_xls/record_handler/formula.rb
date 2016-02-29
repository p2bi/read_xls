module ReadXls
  module RecordHandler
    class Formula < ::ReadXls::RecordHandler::Base
      def call
        row, column, xf_index = record_data.byteslice(0, 6).unpack("v3")
        result_test           = record_data.byteslice(12, 2).unpack("v").first
        number_bytes          = record_data.byteslice(6, 8)

        builder.add_column_to_row(
          row,
          column,
          ::ReadXls::Evaluator::Formula.new(builder, result_test, number_bytes)
        )
      end
    end
  end
end