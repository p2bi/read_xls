module ReadXls
  module Type
    class Boolean
      attr_accessor :value

      def initialize(value)
        self.value = value
      end

      def evaluate
        value == 1
      end
    end
  end
end