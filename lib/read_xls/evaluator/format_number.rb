module ReadXls
  module Evaluator
    class FormatNumber
      SECONDS_IN_DAY = 60 * 60 * 24

      attr_accessor :number, :extended_format

      def initialize(number, extended_format)
        self.number          = BigDecimal.new(number.to_s)
        self.extended_format = extended_format
      end

      def evaluate
        return number unless extended_format

        case extended_format.format_type
          when :date
            days_since_datemode = number.to_i
            inner_day_fraction  = number.frac

            date = build_date(days_since_datemode)

            if inner_day_fraction == 0
              date
            else
              build_time(date, inner_day_fraction)
            end
          else
            number
        end
      end


      private

      def build_date(days_since_datemode)
        Date.new(1899, 12, 30) + days_since_datemode
      end


      def build_time(date, inner_day_fraction)
        time = Time.parse("#{date.year}-#{date.month}-#{date.day}T00:00:00Z")
        time + (inner_day_fraction * SECONDS_IN_DAY).round(0)
      end
    end
  end
end