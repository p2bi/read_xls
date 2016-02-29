module ReadXls
  module RecordHandler
    class String < ::ReadXls::RecordHandler::Base
      def call
        char_length, grbit = record_data.byteslice(0, 3).unpack("vC")
        char_byte_size     = grbit == 0 ? 1 : 2

        string = record_data.byteslice(3, char_byte_size * char_length)
        builder.add_formula_string(string)
      end
    end
  end
end