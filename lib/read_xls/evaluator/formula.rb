module ReadXls
  module Evaluator
    class Formula
      attr_accessor :non_number_test, :number_bytes

      def initialize(non_number_test, number_bytes)
        self.non_number_test = non_number_test
        self.number_bytes    = number_bytes
      end

      def evaluate
        if non_number_test == 0xFFFF
          # raise NotImplementedError
          ""
        else
          number_bytes.unpack("E").first
        end
      end
    end
  end
end