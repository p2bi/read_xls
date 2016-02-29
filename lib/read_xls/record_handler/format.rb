module ReadXls
  module RecordHandler
    class Format < ::ReadXls::RecordHandler::Base
      F_HIGH_BYTE         = 0x01

      def call
        index, char_count, grbit = record_data
                                     .byteslice(0, 5)
                                     .unpack("v2C")

        char_byte_size = (grbit & F_HIGH_BYTE) == 0 ? 1 : 2

        string_length = char_count * char_byte_size
        format_string = record_data.byteslice(5, string_length)

        builder.add_format(index, format_string)
      end
    end
  end
end