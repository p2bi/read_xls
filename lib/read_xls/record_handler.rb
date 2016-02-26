module ReadXls
  module RecordHandler
    RecordHandlerNotFound = Class.new(StandardError)

    ARRAY                = 0x0221
    BLANK                = 0x0201
    SHRFMLA              = 0x00bc
    MMS_ADD_DELETE       = 0x00C1
    BOF                  = 0x0809
    BOF_2                = 0x09
    BOF_3                = 0x209
    BOF_4                = 0x409
    BOOLERR              = 0x0205
    BOUNDSHEET           = 0x0085
    CODEPAGE             = 0x0042
    COLINFO              = 0x007d
    CONTINUE             = 0x003c
    DATESYSTEM           = 0x0022
    DBCELL               = 0x00d7
    DIMENSIONS           = 0x0200
    EOF                  = 0x000a
    FONT                 = 0x0031
    FORMAT               = 0x041e
    FORMULA              = 0x0006
    HLINK                = 0x01b8
    PROT4REVPASS         = 0x01bc
    LABEL                = 0x0204
    LABELSST             = 0x00fd
    INTERFACEHDR         = 0x00e1
    INTERFACEEND         = 0x00e2
    MERGEDCELLS          = 0x00e5
    MULBLANK             = 0x00be
    MULRK                = 0x00bd
    NUMBER               = 0x0203
    RK                   = 0x027e
    ROW                  = 0x0208
    SST                  = 0x00fc
    STRING               = 0x0207
    RSTRING              = 0x00d6
    STYLE                = 0x0293
    STYLEEXT             = 0x0892
    XF                   = 0x00e0
    XFCRC                = 0x087c
    XFEXT                = 0x087d
    SHAREDFMLA           = 0x04bc
    EXTSST               = 0x00ff
    INDEX                = 0x020b
    UNCALCED             = 0x005e
    CALCCOUNT            = 0x000c
    CALCMODE             = 0x000d
    PRECISION            = 0x000e
    REFMODE              = 0x000f
    DELTA                = 0x0010
    ITERATION            = 0x0011
    SAVERECALC           = 0x005f
    PROTECT              = 0x0012
    WINDOWPROT           = 0x0019
    OBJECTPROT           = 0x0063
    SCENPROTECT          = 0x00dd
    PASSWORD             = 0x0013
    WRITEPROT            = 0x0086
    FILEPASS             = 0x002f
    WRITEACCESS          = 0x005c
    FILESHARING          = 0x005b
    SUPBOOK              = 0x01ae
    PROT4REV             = 0x01af
    EXTERNNAME           = 0x0223
    XCT                  = 0x0059
    CRN                  = 0x005a
    EXTERNSHEET          = 0x0017
    NAME                 = 0x0218
    WINDOW1              = 0x003d
    BACKUP               = 0x0040
    COUNTRY              = 0x008c
    HIDEOBJ              = 0x008d
    PALETTE              = 0x0092
    FNGROUPCNT           = 0x009c
    BOOKBOOL             = 0x00da
    TABID                = 0x013d
    USESELFS             = 0x0160
    DSF                  = 0x0161
    REFRESHALL           = 0x01b7
    WINDOW2              = 0x023e
    SCL                  = 0x00a0
    PANE                 = 0x0041
    SELECTION            = 0x001d
    HPAGEBREAKS          = 0x001b
    VPAGEBREAKS          = 0x001a
    HEADER               = 0x0014
    FOOTER               = 0x0015
    HCENTER              = 0x0083
    VCENTER              = 0x0084
    LEFTMARGIN           = 0x0026
    RIGHTMARGIN          = 0x0027
    TOPMARGIN            = 0x0028
    BOTTOMMARGIN         = 0x0029
    PAGESETUP            = 0x00a1
    PRINTHEADERS         = 0x002a
    PRINTGRIDLNS         = 0x002b
    GRIDSET              = 0x0082
    GUTS                 = 0x0080
    DEFROWHEIGHT         = 0x0225
    WSBOOL               = 0x0081
    DEFCOLWIDTH          = 0x0055
    SORT                 = 0x0090
    NOTE                 = 0x001c
    OBJ                  = 0x005d
    TXO                  = 0x0016
    TABLESTYLES          = 0x088e
    AUTOFILTER12         = 0x087e
    MTRSETTINGS          = 0x089a
    FORCEFULLCALCULATION = 0x08a3
    RECALCID             = 0x01c1
    THEME                = 0x0896
    PLV                  = 0x088b
    FEATHEADR            = 0x0867
    FEATHEADR11          = 0x0871
    FEATINFO             = 0x086d
    UNKNOWN1             = 0x105c
    UNKNOWN2             = 0x08d6

    MAPPINGS = {
      BOF                  => Bof,
      ROW                  => Row,
      BOUNDSHEET           => Boundsheet,
      BOOLERR              => Boolerr,
      SST                  => Sst,

      XF                   => Skip,
      DBCELL               => Skip,
      INDEX                => Skip,
      CALCMODE             => Skip,
      INTERFACEHDR         => Skip,
      MMS_ADD_DELETE       => Skip,
      INTERFACEEND         => Skip,
      WRITEACCESS          => Skip,
      CODEPAGE             => Skip,
      DSF                  => Skip,
      TABID                => Skip,
      FNGROUPCNT           => Skip,
      WINDOWPROT           => Skip,
      PROTECT              => Skip,
      PASSWORD             => Skip,
      FILEPASS             => Skip,
      PROT4REV             => Skip,
      PROT4REVPASS         => Skip,
      WINDOW1              => Skip,
      BACKUP               => Skip,
      HIDEOBJ              => Skip,
      DATESYSTEM           => Skip,
      PRECISION            => Skip,
      REFRESHALL           => Skip,
      BOOKBOOL             => Skip,
      FONT                 => Skip,
      FORMAT               => Skip,
      XFCRC                => Skip,
      XFEXT                => Skip,
      STYLE                => Skip,
      STYLEEXT             => Skip,
      TABLESTYLES          => Skip,
      AUTOFILTER12         => Skip,
      PALETTE              => Skip,
      USESELFS             => Skip,
      MTRSETTINGS          => Skip,
      FORCEFULLCALCULATION => Skip,
      COUNTRY              => Skip,
      RECALCID             => Skip,
      LABELSST             => Skip,
      EXTSST               => Skip,
      THEME                => Skip,
      CALCCOUNT            => Skip,
      REFMODE              => Skip,
      ITERATION            => Skip,
      DELTA                => Skip,
      SAVERECALC           => Skip,
      PRINTHEADERS         => Skip,
      PRINTGRIDLNS         => Skip,
      GRIDSET              => Skip,
      GUTS                 => Skip,
      DEFROWHEIGHT         => Skip,
      WSBOOL               => Skip,
      HEADER               => Skip,
      FOOTER               => Skip,
      HPAGEBREAKS          => Skip,
      VPAGEBREAKS          => Skip,
      HCENTER              => Skip,
      VCENTER              => Skip,
      LEFTMARGIN           => Skip,
      RIGHTMARGIN          => Skip,
      TOPMARGIN            => Skip,
      BOTTOMMARGIN         => Skip,
      PAGESETUP            => Skip,
      DEFCOLWIDTH          => Skip,
      DIMENSIONS           => Skip,
      WINDOW2              => Skip,
      PLV                  => Skip,
      FEATHEADR            => Skip,
      FEATHEADR11          => Skip,
      FEATINFO             => Skip,
      SELECTION            => Skip,
      UNKNOWN1             => Skip,
      UNKNOWN2             => Skip,

      ARRAY                => NotImplemented,
      BLANK                => NotImplemented,
      SHRFMLA              => NotImplemented,
      BOF_2                => NotImplemented,
      BOF_3                => NotImplemented,
      BOF_4                => NotImplemented,
      BLANK                => NotImplemented,
      COLINFO              => NotImplemented,
      CONTINUE             => NotImplemented,
      EOF                  => NotImplemented,
      FORMULA              => NotImplemented,
      HLINK                => NotImplemented,
      LABEL                => NotImplemented,
      MERGEDCELLS          => NotImplemented,
      MULBLANK             => NotImplemented,
      MULRK                => NotImplemented,
      NUMBER               => NotImplemented,
      RK                   => NotImplemented,
      RSTRING              => NotImplemented,
      STRING               => NotImplemented,
      SHAREDFMLA           => NotImplemented,
      UNCALCED             => NotImplemented,
      OBJECTPROT           => NotImplemented,
      SCENPROTECT          => NotImplemented,
      WRITEPROT            => NotImplemented,
      FILESHARING          => NotImplemented,
      SUPBOOK              => NotImplemented,
      EXTERNNAME           => NotImplemented,
      XCT                  => NotImplemented,
      CRN                  => NotImplemented,
      EXTERNSHEET          => NotImplemented,
      NAME                 => NotImplemented,
      SCL                  => NotImplemented,
      PANE                 => NotImplemented,
      SORT                 => NotImplemented,
      NOTE                 => NotImplemented,
      OBJ                  => NotImplemented,
      TXO                  => NotImplemented
    }

    def self.for(record_number)
      MAPPINGS[record_number] || raise(RecordHandlerNotFound, "couldn't find record handler for #{record_number.to_s(16)}")
    end
  end
end