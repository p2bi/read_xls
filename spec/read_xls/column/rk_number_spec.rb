require "spec_helper"

module ReadXls
  module Column
    RSpec.describe RkNumber do
      specify "type 0" do
        type_0_number = 0x3ff00000

        rk_number = RkNumber.new(type_0_number)

        expect(rk_number.evaluate).to eq(1)
      end

      specify "type 1" do
        type_0_number = 0x405ec001

        rk_number = RkNumber.new(type_0_number)

        expect(rk_number.evaluate).to eq(1.23)
      end

      specify "type 2" do
        type_2_number = 0x02f1853a

        rk_number = RkNumber.new(type_2_number)

        expect(rk_number.evaluate).to eq(12345678)
      end

      specify "type 3" do
        type_3_number = 0x02f1853b

        rk_number = RkNumber.new(type_3_number)

        expect(rk_number.evaluate).to eq(123456.78)
      end
    end
  end
end