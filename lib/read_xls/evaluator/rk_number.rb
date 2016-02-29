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

        FormatNumber.new(value, extended_format).evaluate
      end


      private

      def extended_format
        builder.extended_formats[xf_index]
      end
    end
  end
end