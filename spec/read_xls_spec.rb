require "spec_helper"

describe ReadXls do
  describe ".parse" do
    it "returns the correct number of rows" do
      spreadsheet = ReadXls.parse(
        get_spreadsheet_path("simple_no_headers.xls")
      )

      expect(spreadsheet.sheets.length).to eq(1)
      expect(spreadsheet.sheets.first.rows.length).to eq(4)
      # expect(spreadsheet.sheets.first.rows.first.columns.map(&:value)).to eq(["apple", "orange", "banana", "strawberry"])
      expect(spreadsheet.sheets.first.rows.last.columns.map(&:value)).to eq([true, false, true, false])
    end
  end

  def get_spreadsheet_path(name)
    File.join(File.expand_path(File.dirname(__FILE__)), "/spreadsheets/#{name}")
  end
end