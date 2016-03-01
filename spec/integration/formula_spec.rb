require "spec_helper"

describe ReadXls do
  describe ".parse" do
    it "parses formulas" do
      spreadsheet = ReadXls.parse(
        get_spreadsheet_path("formula.xls")
      )


      sheet = spreadsheet.sheets
      expect(sheet.first.rows[0][1]).to eq(21)
      expect(sheet.first.rows[0][2]).to eq(25.5)
      expect(sheet.first.rows[1][1]).to eq(3.5)
      expect(sheet.first.rows[2][1]).to eq(1)
      expect(sheet.first.rows[3][1]).to eq("Hello World")
    end
  end
end
