module ReadXls
  module RecordHandler
    class MulRk < ::ReadXls::RecordHandler::Base
      RKREC_SIZE       = 6
      RK_DATA_OFFSET   = 4
      RK_NUMBER_OFFSET = 2
      RK_NUMBER_SIZE   = 4

      def call
        row, first_column = record_data[0, 4].unpack("v2")
        last_column       = record_data[-2, 2].unpack("v").first
        number_of_columns = last_column - first_column + 1
        rk_data           = record_data[RK_DATA_OFFSET..-3]

        number_of_columns.times.each do |column_index|
          rk_rec   = rk_data[(column_index * RKREC_SIZE), RKREC_SIZE]
          rk_bits = rk_rec[RK_NUMBER_OFFSET, RK_NUMBER_SIZE].unpack("V").first

          rk_column = ::ReadXls::Column::RkNumber.new(rk_bits)

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