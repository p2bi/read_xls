require "read_xls/version"

require "contracts"
C = Contracts

require "ole/storage"

require "read_xls/type/workbook"
require "read_xls/type/worksheet"
require "read_xls/type/boolean"
require "read_xls/type/row"
require "read_xls/type/shared_string_table"
require "read_xls/type/sst_string"

require "read_xls/workbook_builder"
require "read_xls/worksheet_builder"

require "read_xls/record_handler/base"
require "read_xls/record_handler/skip"
require "read_xls/record_handler/not_implemented"
require "read_xls/record_handler/bof"
require "read_xls/record_handler/boolerr"
require "read_xls/record_handler/boundsheet"
require "read_xls/record_handler/row"
require "read_xls/record_handler/sst"
require "read_xls/record_handler/label_sst"
require "read_xls/record_handler"

require "read_xls/spreadsheet"


module ReadXls
  def self.parse(xls_path)
    Spreadsheet.parse(xls_path)
  end
end
