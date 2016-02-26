module ReadXls
  module RecordHandler
    class Sst < ::ReadXls::RecordHandler::Base
      def call
        # unique_strings = record_data[4, 4].unpack("V").first

        # ::ReadXls::Type::SharedStringTable.new()
      end
    end
  end
end