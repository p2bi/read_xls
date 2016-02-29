module ReadXls
  module Evaluator
    class RkNumber
      attr_accessor :builder, :rk_bits, :xf_index

      def initialize(builder, rk_bits, xf_index)
        self.builder  = builder
        self.rk_bits  = rk_bits
        self.xf_index = xf_index
      end

      def evaluate
        value = if (rk_bits & 0x02) == 0
                  rk_bits_without_last_2            = (rk_bits & 0xfffffffc)
                  float_in_64_bit_string_big_endian = (("%032b" % rk_bits_without_last_2) + "0"*32)
                  [float_in_64_bit_string_big_endian].pack("B*").unpack("G").first
                else
                  rk_bits >> 2
                end

        value = if (rk_bits & 0x01) == 0
                  value
                else
                  value / 100.0
                end

        format_value(value)
      end


      private

      def format_value(value)
        case extended_format.format_type
          when :date
            big_value           = BigDecimal.new(value.to_s)
            days_since_datemode = big_value.to_i
            inner_day_fraction  = big_value.frac

            if inner_day_fraction == 0
              build_date(days_since_datemode)
            else
              raise NotImplementedError
            end
          else
            value
        end
      end

      def extended_format
        builder.extended_formats[xf_index]
      end

      def build_date(days_since_datemode)
        Date.new(1899,12,30) + days_since_datemode
      end
    end
  end
end