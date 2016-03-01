require "spec_helper"

describe ReadXls do
  describe ".parse" do
    it "parses simple dates" do
      spreadsheet = ReadXls.parse(
        get_spreadsheet_path("time_dates.xls")
      )

      expect(spreadsheet.sheets.first.rows.length).to eq(14)
      expect(spreadsheet.sheets.first.rows[0][0]).to eq(Date.new(2015, 1, 1))
      expect(spreadsheet.sheets.first.rows[1][0]).to eq(Date.new(2015, 2, 2))
      expect(spreadsheet.sheets.first.rows[2][0]).to eq(Date.new(2015, 3, 3))
      expect(spreadsheet.sheets.first.rows[3][0]).to eq(Date.new(2015, 4, 1))
      expect(spreadsheet.sheets.first.rows[4][0]).to eq(Date.new(2015, 4, 30))
      expect(spreadsheet.sheets.first.rows[5][0]).to eq(Date.new(2015, 5, 29))
      expect(spreadsheet.sheets.first.rows[6][0]).to eq(Date.new(2015, 6, 27))
      expect(spreadsheet.sheets.first.rows[7][0]).to eq(Date.new(2015, 7, 26))
      expect(spreadsheet.sheets.first.rows[8][0]).to eq(Date.new(2015, 8, 24))
      expect(spreadsheet.sheets.first.rows[9][0]).to eq(Date.new(2015, 9, 22))
      expect(spreadsheet.sheets.first.rows[10][0]).to eq(Date.new(2015, 12, 18))
      expect(spreadsheet.sheets.first.rows[11][0]).to eq(Date.new(2016, 1, 16))
      expect(spreadsheet.sheets.first.rows[12][0]).to eq(Date.new(2016, 2, 14))
      expect(spreadsheet.sheets.first.rows[13][0]).to eq(Date.new(2016, 3, 14))
    end

    it "parses simple times" do
      spreadsheet = ReadXls.parse(
        get_spreadsheet_path("time_times.xls")
      )

      expect(spreadsheet.sheets.first.rows.length).to eq(14)
      expect(spreadsheet.sheets.first.rows[0][0]).to eq(Time.parse("2015-01-01T23:59:59Z"))
      expect(spreadsheet.sheets.first.rows[1][0]).to eq(Time.parse("2015-02-02T00:00:01Z"))
    end
  end
end
