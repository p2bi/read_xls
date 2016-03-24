require "spec_helper"

describe ReadXls do
  describe ".parse" do
    specify "parsing an example ar agings doc" do
      spreadsheet = ReadXls.parse(
        get_spreadsheet_path("complex_examples_aging.xls")
      )

      sheet = spreadsheet.sheets.first
      expect(sheet.rows.length).to eq(85)

      first_row = sheet.rows.first
      expect(first_row[1]).to eq("A/R Aging Detail")
      expect(first_row[10]).to eq("Borrower")
      expect(first_row[14]).to eq("Some borrower")

      invoice_row = sheet.rows[6]
      expect(invoice_row[0]).to eq("1336")
      expect(invoice_row[3]).to eq(Date.parse("2016-02-29"))
      expect(invoice_row[5]).to eq("I")
      expect(invoice_row[8]).to eq(BigDecimal.new("9100.00"))

      last_row = sheet.rows.last
      expect(last_row.length).to eq(22)
      expect(last_row[9]).to eq(0)
      expect(last_row[11]).to eq(BigDecimal.new("0.7264333545173156"))
      expect(last_row[12]).to eq(BigDecimal.new("0.08128845119510449"))
      expect(last_row[15]).to eq(BigDecimal.new("0.11207466063190588"))
      expect(last_row[16]).to eq(BigDecimal.new("0.013661924570605796"))
      expect(last_row[17]).to eq(BigDecimal.new("0.06654160908506822"))
    end
  end
end
