require "spec_helper"

describe ReadXls do
  describe ".parse" do
    it "parses wide_row_256" do
      spreadsheet = ReadXls.parse(
        get_spreadsheet_path("wide_row_256.xls")
      )

      expect(spreadsheet.sheets.first.rows.length).to eq(1)
      expect(spreadsheet.sheets.first.rows[0].length).to eq(256)
      expect(spreadsheet.sheets.first.rows[0]).to eq((1..256).to_a)
    end
  end

  def get_spreadsheet_path(name)
    File.join(File.expand_path(File.dirname(__FILE__)), "/spreadsheets/#{name}")
  end
end
