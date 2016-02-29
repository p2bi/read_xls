$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require "read_xls"


def get_spreadsheet_path(name)
  File.join(File.expand_path(File.dirname(__FILE__)), "integration/spreadsheets/#{name}")
end