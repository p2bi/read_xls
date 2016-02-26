module ReadXls
  module Type
    class Boolean
      attr_accessor :value

      def initialize(value)
        self.value = value == 1
      end

      def to_s
        value.to_s
      end
    end
  end
end