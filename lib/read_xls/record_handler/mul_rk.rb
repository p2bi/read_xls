module ReadXls
  module RecordHandler
    class MulRk < ::ReadXls::RecordHandler::Base
      RKREC_SIZE     = 6
      RK_DATA_OFFSET = 4

      def call
        row, first_column = record_data
                              .byteslice(0, 4)
                              .unpack("v2")
        last_column       = record_data[-2, 2].unpack("v").first
        number_of_columns = last_column - first_column + 1
        rk_data           = record_data[RK_DATA_OFFSET..-3]

        number_of_columns.times.each do |column_index|
          rk_rec            = rk_data[(column_index * RKREC_SIZE), RKREC_SIZE]
          ix_index, rk_bits = rk_rec.byteslice(0, RKREC_SIZE).unpack("vV")

          rk_column = ::ReadXls::Evaluator::RkNumber.new(builder, rk_bits, ix_index)

          builder.add_column_to_row(
            row,
            column_index,
            rk_column
          )
        end
      end
    end
  end
end