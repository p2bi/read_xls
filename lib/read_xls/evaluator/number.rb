module ReadXls
  module Evaluator
    class Number
      attr_accessor :builder, :number, :xf_index

      def initialize(builder, number, xf_index)
        self.builder  = builder
        self.number   = number
        self.xf_index = xf_index
      end

      def evaluate
        FormatNumber.new(number, extended_format).evaluate
      end


      private

      def extended_format
        builder.extended_formats[xf_index]
      end
    end
  end
end