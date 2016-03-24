require "spec_helper"

describe ReadXls do
  describe ".parse" do
    specify "parsing an example ar agings doc" do
      spreadsheet = ReadXls.parse(
        get_spreadsheet_path("complex_examples_aging.xls")
      )


      sheet = spreadsheet.sheets.first
      expect(sheet.rows.length).to eq(85)
    end
  end
end
