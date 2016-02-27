module ReadXls
  module Column
    class RkNumber
      attr_accessor :rk_bits

      def initialize(rk_bits)
        self.rk_bits = rk_bits
      end

      def evaluate
        value = if (rk_bits & 0x02) == 0
                  rk_bits_without_last_2 = (rk_bits & 0xfffffffc)
                  float_in_64_bit_string_big_endian = (("%032b" % rk_bits_without_last_2) + "0"*32)
                  [float_in_64_bit_string_big_endian].pack("B*").unpack("G").first
                else
                  rk_bits >> 2
                end

        if (rk_bits & 0x01) == 0
          value
        else
          value / 100
        end
      end
    end
  end
end