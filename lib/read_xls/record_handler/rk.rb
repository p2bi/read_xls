module ReadXls
  module RecordHandler
    class Rk < ::ReadXls::RecordHandler::Base
      def call
        row, column, xf_index = record_data
                                  .byteslice(0, 6)
                                  .unpack("v3")
        rk_bits               = record_data
                                  .byteslice(6, 4)
                                  .unpack("V")
                                  .first

        rk_column = ::ReadXls::Evaluator::RkNumber.new(builder, rk_bits, xf_index)

        builder.add_column_to_row(
          row,
          column,
          rk_column
        )
      end
    end
  end
end