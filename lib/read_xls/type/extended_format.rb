module ReadXls
  module Type
    class ExtendedFormat
      attr_accessor :format_string

      def initialize(options)
        self.format_string = options.fetch(:format_string)
      end
    end
  end
end