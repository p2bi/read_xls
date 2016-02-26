module ReadXls
  module RecordHandler
    class Boolerr < ::ReadXls::RecordHandler::Base
      def call
        row, column, _, value, _ = record_data.unpack("v3C2")

        builder.add_column_to_row(row, column, ::ReadXls::Type::Boolean.new(value))
      end
    end
  end
end