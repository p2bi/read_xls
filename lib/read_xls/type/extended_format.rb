module ReadXls
  module Type
    class ExtendedFormat
      attr_accessor :format_string

      FORMAT_MATCHERS = {
        /[YMDymd]/ => :date
      }

      def initialize(options)
        self.format_string = options.fetch(:format_string)
      end

      def format_type
        matched_types = FORMAT_MATCHERS.select { |matcher, _| format_string =~ matcher }

        if matched_types.length != 1
          raise "got more than one match, expected only one matched format type"
        end

        matched_types.values.first
      end
    end
  end
end