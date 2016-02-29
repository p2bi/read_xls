require "spec_helper"

describe ReadXls do
  describe ".parse" do
    it "parses simple" do
      spreadsheet = ReadXls.parse(
        get_spreadsheet_path("simple.xls")
      )

      expect(spreadsheet.sheets.length).to eq(1)
      expect(spreadsheet.sheets.first.rows.length).to eq(4)
      expect(spreadsheet.sheets.first.rows[0]).to eq(["apple", "orange", "banana", "strawberry"])
      expect(spreadsheet.sheets.first.rows[1]).to eq(["monkey", "bear", "giraffe", "eagle"])
      expect(spreadsheet.sheets.first.rows[2]).to eq(["sara", "john", "nick", "nicole"])
      expect(spreadsheet.sheets.first.rows[3]).to eq([true, false, true, false])
    end

    it "parses row_spacing" do
      spreadsheet = ReadXls.parse(
        get_spreadsheet_path("row_spacing.xls")
      )

      expect(spreadsheet.sheets.length).to eq(1)
      expect(spreadsheet.sheets.first.rows.length).to eq(4)
      expect(spreadsheet.sheets.first.rows[0]).to eq(["a", "b", "c", "d"])
      expect(spreadsheet.sheets.first.rows[1]).to eq([])
      expect(spreadsheet.sheets.first.rows[2]).to eq([])
      expect(spreadsheet.sheets.first.rows[3]).to eq(["e", "f", "g", "h"])
    end

    it "parses column_spacing" do
      spreadsheet = ReadXls.parse(
        get_spreadsheet_path("column_spacing.xls")
      )

      expect(spreadsheet.sheets.length).to eq(1)
      expect(spreadsheet.sheets.first.rows.length).to eq(2)
      expect(spreadsheet.sheets.first.rows[0]).to eq(["a", nil, "b", nil, "c", nil, "d"])
      expect(spreadsheet.sheets.first.rows[1]).to eq([nil, "e", nil, "f", nil, "g"])
    end

    it "parses dates" do
      spreadsheet = ReadXls.parse(
        get_spreadsheet_path("dates.xls")
      )

      expect(spreadsheet.sheets.first.rows.length).to eq(16)
      date = spreadsheet.sheets.first.rows[0][0]
      expect(date).to eq("1/1/15")
    end
  end

  def get_spreadsheet_path(name)
    File.join(File.expand_path(File.dirname(__FILE__)), "/spreadsheets/#{name}")
  end
end
