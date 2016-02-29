module ReadXls
  module Evaluator
    class Formula
      attr_accessor :builder, :result_number, :result_bytes

      def initialize(builder, result_test, result_bytes)
        self.builder       = builder
        self.result_number = result_test != 0xFFFF
        self.result_bytes  = result_bytes
      end

      def evaluate
        if result_number?
          result_bytes.unpack("E").first
        elsif result_string?
          builder.next_formula_string!
        elsif result_boolerr?
          raise NotImplementedError
        else
          raise NotImplementedError, "can't figure out what type of formula this is"
        end
      end

      def result_number?
        result_number
      end

      def result_string?
        !result_number? && result_bytes.byteslice(0, 1).unpack("C").first == 0
      end
    end
  end
end