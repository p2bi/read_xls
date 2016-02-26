module ReadXls
  module Type
    class Worksheet
      attr_accessor :rows

      def initialize(options)
        self.rows = options.fetch(:rows)
      end
    end
  end
end