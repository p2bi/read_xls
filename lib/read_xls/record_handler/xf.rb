module ReadXls
  module RecordHandler
    class Xf < ::ReadXls::RecordHandler::Base
      def call
        format_index = record_data
                         .byteslice(2, 2)
                         .unpack("v")
                         .first

        builder.add_extended_format(
          ::ReadXls::Evaluator::ExtendedFormat.new(
            :builder      => builder,
            :format_index => format_index
          )
        )
      end
    end
  end
end