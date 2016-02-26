module ReadXls
  module RecordHandler
    class Base
      attr_accessor :builder, :biff, :record_number, :record_data

      def self.call(builder, biff, record_number, record_data)
        new(builder, biff, record_number, record_data).call
      end

      def initialize(builder, biff, record_number, record_data)
        self.builder       = builder
        self.biff          = biff
        self.record_number =record_number
        self.record_data   = record_data
      end
    end
  end
end

