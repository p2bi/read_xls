require "spec_helper"

describe ReadXls do
  describe ".parse" do
    it "parses simple" do
      spreadsheet = ReadXls.parse(
        get_spreadsheet_path("strings_simple.xls")
      )

      expect(spreadsheet.sheets.length).to eq(1)
      expect(spreadsheet.sheets.first.rows.length).to eq(4)
      expect(spreadsheet.sheets.first.rows[0]).to eq(["apple", "orange", "banana", "strawberry"])
      expect(spreadsheet.sheets.first.rows[1]).to eq(["monkey", "bear", "giraffe", "eagle"])
      expect(spreadsheet.sheets.first.rows[2]).to eq(["sara", "john", "nick", "nicole"])
      expect(spreadsheet.sheets.first.rows[3]).to eq([true, false, true, false])
    end

    it "handles duplicate strings" do
      spreadsheet = ReadXls.parse(
        get_spreadsheet_path("strings_duplicates.xls")
      )

      expect(spreadsheet.sheets.length).to eq(1)
      expect(spreadsheet.sheets.first.rows.length).to eq(4)
      expect(spreadsheet.sheets.first.rows[0]).to eq(["apple", "orange", "banana", "strawberry"])
      expect(spreadsheet.sheets.first.rows[1]).to eq(["apple", "orange", "banana", "strawberry"])
      expect(spreadsheet.sheets.first.rows[2]).to eq(["apple", "orange", "banana", "strawberry"])
      expect(spreadsheet.sheets.first.rows[3]).to eq(["apple", "orange", "banana", "strawberry"])
    end
  end
end
