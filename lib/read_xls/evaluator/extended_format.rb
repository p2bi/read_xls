module ReadXls
  module Evaluator
    class ExtendedFormat
      attr_accessor :builder, :format_index

      def initialize(options)
        self.builder      = options.fetch(:builder)
        self.format_index = options.fetch(:format_index)
      end

      def evaluate
        format_string = builder.formats[format_index]

        ::ReadXls::Type::ExtendedFormat.new(
          :format_string => format_string
        )
      end
    end
  end
end