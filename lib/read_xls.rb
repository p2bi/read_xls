require "read_xls/version"

require "contracts"
C = Contracts

require "ole/storage"

require "read_xls/column/boolean"
require "read_xls/column/null"
require "read_xls/column/rk_number"
require "read_xls/column/sst_string"

require "read_xls/workbook"
require "read_xls/workbook_builder"
require "read_xls/workbook/worksheet"
require "read_xls/workbook/row"
require "read_xls/workbook/shared_string_table"
require "read_xls/workbook/worksheet_builder"


require "read_xls/record_handler/base"
require "read_xls/record_handler/blank"
require "read_xls/record_handler/bof"
require "read_xls/record_handler/boolerr"
require "read_xls/record_handler/boundsheet"
require "read_xls/record_handler/label_sst"
require "read_xls/record_handler/mul_rk"
require "read_xls/record_handler/not_implemented"
require "read_xls/record_handler/row"
require "read_xls/record_handler/rk"
require "read_xls/record_handler/skip"
require "read_xls/record_handler/sst"
require "read_xls/record_handler"

require "read_xls/spreadsheet"


module ReadXls
  def self.parse(xls_path)
    Spreadsheet.parse(xls_path)
  end
end
