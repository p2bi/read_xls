module ReadXls
  module RecordHandler
    class Sst < ::ReadXls::RecordHandler::Base
      F_HIGH_BYTE         = 0x01
      STRING_BEGIN_OFFSET = 3
      DATA_OFFSET         = 8
      STRING_COUNT_OFFSET = 0

      def call
        string_count    = record_data[STRING_COUNT_OFFSET, 4].unpack("V").first
        string_data     = record_data[DATA_OFFSET..-1]
        string_position = 0

        strings = string_count.times.map do
          char_count, grbit = string_data[string_position, STRING_BEGIN_OFFSET].unpack("vC")

          char_byte_size = (grbit & F_HIGH_BYTE) == 0 ? 1 : 2
          string_begin   = string_position + STRING_BEGIN_OFFSET
          string_end     = string_begin + (char_count * char_byte_size) - 1

          string_position = string_end + 1
          string_data[string_begin..string_end]
        end

        builder.sst = ::ReadXls::Type::SharedStringTable.new(strings.uniq)
      end
    end
  end
end