module ReadXls
  module RecordHandler
    class NotImplemented < ::ReadXls::RecordHandler::Base
      RecordHandlerNotImplementedError = Class.new(StandardError)

      def call
        raise RecordHandlerNotImplementedError, "there is no implementation for #{record_number}"
      end
    end
  end
end