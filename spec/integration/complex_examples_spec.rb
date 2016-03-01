require "spec_helper"

describe ReadXls do
  describe ".parse" do
    specify "complex example 1" do
      spreadsheet = ReadXls.parse(
        get_spreadsheet_path("complex_examples_1.xls")
      )


      sheet = spreadsheet.sheets.first
      expect(sheet.rows.length).to eq(8)
      expect(sheet.rows[0]).to eq(["Invoicee", "Pickup Date", "PRO Number", "Text31", "Text33", "CCity", "CState", "Weight Shipped", "Invoice Amount", "Rep Code"])
      expect(sheet.rows[1]).to eq(["CHECKERS", Date.new(2016, 1, 19), 111111, nil, 0, "PORTLAND", "CO", 6834, 1932.23, "ABC"])
      expect(sheet.rows[2]).to eq([nil, Date.new(2016, 1, 19), 222222, nil, 0, "DENVER", "CO", 37364, 4557.08, "ABC"])
      expect(sheet.rows[3]).to eq(["CHRISTY", Date.new(2016, 1, 19), 333333, nil, 0, "BLOOMBERG 80215", nil, 5512, 5306.40, "ABC"])
      expect(sheet.rows[4]).to eq(["COOKING", Date.new(2016, 1, 19), 444444, "MANIFEST 111", 0, "ANYCITY", "CO", 4059, 1337.80, "CDF"])
      expect(sheet.rows[5]).to eq([nil, Date.new(2016, 1, 20), 555555, "MANIFEST 2222", 0, "ANYCITY", "CO", 2425, 780.14, "CDF"])
      expect(sheet.rows[6]).to eq([])
      expect(sheet.rows[7]).to eq([])
    end
  end
end
