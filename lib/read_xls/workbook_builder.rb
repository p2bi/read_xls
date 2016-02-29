module ReadXls
  class WorkbookBuilder
    attr_accessor :biff, :worksheet_builders, :sst, :formats, :extended_formats

    def initialize(biff)
      self.biff               = biff
      self.worksheet_builders = []
      self.formats            = default_formats
      self.extended_formats   = []
    end

    def add_worksheet_builder(worksheet_builder)
      self.worksheet_builders.push(worksheet_builder)
    end

    def add_format(format_index, format_string)
      self.formats[format_index] = format_string
    end

    def add_extended_format(extended_format)
      self.extended_formats.push(extended_format)
    end

    def build
      workbook                  = ::ReadXls::Workbook.new
      workbook.formats          = build_formats
      workbook.extended_formats = build_extended_formats
      workbook.worksheets       = build_worksheets
      workbook
    end


    private

    def build_formats
      @_formats ||= formats.dup
    end

    def build_extended_formats
      @_extended_formats ||= extended_formats.map(&:evaluate)
    end

    def build_worksheets
      worksheet_builders.map do |worksheet_builder|
        raise "no sst found!" if sst.nil?

        worksheet_builder.sst              = sst
        worksheet_builder.formats          = build_formats
        worksheet_builder.extended_formats = build_extended_formats

        worksheet_builder.build
      end
    end

    def default_formats
      [
        "General",
        "0",
        "0.00",
        "#,##0",
        "#,##0.00",
        "$#,##0_);($#,##0)",
        "$#,##0_);[Red]($#,##0)",
        "$#,##0.00_);($#,##0.00)",
        "$#,##0.00_);[Red]($#,##0.00)",
        "0%",
        "0.00%",
        "0.00E+00",
        "# ?/?",
        "# ??/??",
        "M/D/YY",
        "D-MMM-YY",
        "D-MMM",
        "MMM-YY",
        "h:mm AM/PM",
        "h:mm:ss AM/PM",
        "h:mm",
        "h:mm:ss",
        "M/D/YY h:mm",
        "_(#,##0_);(#,##0)",
        "_(#,##0_);[Red](#,##0)",
        "_(#,##0.00_);(#,##0.00)",
        "_(#,##0.00_);[Red](#,##0.00)",
        '_($* #,##0_);_($* (#,##0);_($* "-"_);_(@_)',
        '_(* #,##0_);_(* (#,##0);_(* "-"_);_(@_)',
        '_($* #,##0.00_);_($* (#,##0.00);_($* "-"??_);_(@_)',
        '_(* #,##0.00_);_(* (#,##0.00);_(* "-"??_);_(@_)',
        "mm:ss",
        "[h]:mm:ss",
        "mm:ss.0",
        "##0.0E+0",
        "@"
      ]
    end
  end
end