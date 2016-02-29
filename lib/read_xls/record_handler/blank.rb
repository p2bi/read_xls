module ReadXls
  module RecordHandler
    class Blank < ::ReadXls::RecordHandler::Base
      def call
        row, column = record_data[0, 4].unpack("v2")

        builder.add_column_to_row(row, column, ::ReadXls::Evaluator::Blank.new)
      end
    end
  end
end