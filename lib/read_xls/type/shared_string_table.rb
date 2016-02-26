module ReadXls
  module Type
    class SharedStringTable
      attr_accessor :strings

      def initialize(strings)
        self.strings = strings
      end

      def index(i)
        strings[i]
      end
    end
  end
end