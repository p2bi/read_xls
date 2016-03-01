require "spec_helper"

describe ReadXls do
  describe ".parse" do
    it "parses row_spacing" do
      spreadsheet = ReadXls.parse(
        get_spreadsheet_path("spacings_row.xls")
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
        get_spreadsheet_path("spacings_column.xls")
      )

      expect(spreadsheet.sheets.length).to eq(1)
      expect(spreadsheet.sheets.first.rows.length).to eq(2)
      expect(spreadsheet.sheets.first.rows[0]).to eq(["a", nil, "b", nil, "c", nil, "d"])
      expect(spreadsheet.sheets.first.rows[1]).to eq([nil, "e", nil, "f", nil, "g"])
    end
  end

  def get_spreadsheet_path(name)
    File.join(File.expand_path(File.dirname(__FILE__)), "/spreadsheets/#{name}")
  end
end
