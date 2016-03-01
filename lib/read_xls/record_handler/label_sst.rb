module ReadXls
  module RecordHandler
    class LabelSst < ::ReadXls::RecordHandler::Base
      SST_INDEX_OFFSET = 6
      SST_INDEX_SIZE   = 4

      def call
        row, column = record_data.byteslice(0, 4).unpack("v2")
        sst_index   = record_data.byteslice(SST_INDEX_OFFSET, SST_INDEX_SIZE).unpack("V").first

        builder.add_column_to_row(row, column, ::ReadXls::Evaluator::SstString.new(sst_index, builder))
      end
    end
  end
end