module ReadXls
  module RecordHandler
    class Base
      attr_accessor :record_number, :builder, :biff, :record_data

      def self.call(record_number, builder, biff, record_data)
        new(record_number, builder, biff, record_data).call
      end

      def initialize(record_number, builder, biff, record_data)
        self.record_number =record_number
        self.builder       = builder
        self.biff          = biff
        self.record_data   = record_data
      end
    end
  end
end

