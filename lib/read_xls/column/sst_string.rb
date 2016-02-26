module ReadXls
  module Column
    class SstString
      attr_accessor :sst_index, :builder

      def initialize(sst_index, builder)
        self.sst_index = sst_index
        self.builder   = builder
      end

      def evaluate
        builder.sst.index(sst_index)
      end
    end
  end
end