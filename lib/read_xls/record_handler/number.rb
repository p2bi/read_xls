module ReadXls
  module RecordHandler
    class Number < ::ReadXls::RecordHandler::Base
      def call
        row, column, xf_index = record_data.byteslice(0, 6).unpack("v3")
        number                = record_data.byteslice(6, 8).unpack("E").first

        number_column = ::ReadXls::Evaluator::Number.new(builder, number, xf_index)

        builder.add_column_to_row(
          row,
          column,
          number_column
        )
      end
    end
  end
end