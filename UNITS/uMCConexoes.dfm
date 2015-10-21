inherited FMCConexoes: TFMCConexoes
  Left = 121
  Top = 211
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Conex'#245'es'
  ClientHeight = 332
  ClientWidth = 686
  OldCreateOrder = True
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object btnAlterar: TSpeedButton
    Left = 287
    Top = 302
    Width = 111
    Height = 25
    Caption = '&Alterar conex'#227'o'
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000333300
      0000377777F3337777770FFFF099990FFFF07FFFF7FFFF7FFFF7000000999900
      00007777777777777777307703399330770337FF7F37F337FF7F300003399330
      000337777337F337777333333339933333333FFFFFF7F33FFFFF000000399300
      0000777777F7F37777770FFFF099990FFFF07FFFF7F7FF7FFFF7000000999900
      00007777777777777777307703399330770337FF7F37F337FF7F300003399330
      0003377773F7FFF77773333330000003333333333777777F3333333330FFFF03
      3333333337FFFF7F333333333000000333333333377777733333333333077033
      33333333337FF7F3333333333300003333333333337777333333}
    NumGlyphs = 2
    OnClick = btnAlterarClick
  end
  object btnNovaConexaoTelnet: TSpeedButton
    Left = 4
    Top = 302
    Width = 146
    Height = 25
    Caption = '&Nova conex'#227'o Telnet'
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000333300
      0000377777F3337777770FFFF099990FFFF07FFFF7FFFF7FFFF7000000999900
      00007777777777777777307703399330770337FF7F37F337FF7F300003399330
      000337777337F337777333333339933333333FFFFFF7F33FFFFF000000399300
      0000777777F7F37777770FFFF099990FFFF07FFFF7F7FF7FFFF7000000999900
      00007777777777777777307703399330770337FF7F37F337FF7F300003399330
      0003377773F7FFF77773331330000003333333333777777F3333331330FFFF03
      3333333337FFFF7F333311111000000333333333377777733333331333077033
      33333333337FF7F3333333133300003333333333337777333333}
    NumGlyphs = 2
    OnClick = btnNovaConexaoTelnetClick
  end
  object btnExcluir: TSpeedButton
    Left = 401
    Top = 302
    Width = 111
    Height = 25
    Caption = 'E&xcluir conex'#227'o'
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300911733300
      9700377777F3337777770FF91117990911707FFFF7FFFF7FFFF7000911117991
      11177777777777777777307791111711111737FF7F37F337FF7F300009111111
      117337777337F337777333333391111117333FFFFFF7F33FFFFF000000311111
      0000777777F7F37777770FFFF09911117FF07FFFF7F7FF7FFFF7000000911111
      70007777777777777777307709111711170337FF7F37F337FF7F300091117391
      1173377773F7FFF77773333391170009111733333777777F33333333391FFF03
      9111333337FFFF7F333333333000000339193333377777733333333333077033
      33333333337FF7F3333333333300003333333333337777333333}
    NumGlyphs = 2
    OnClick = btnExcluirClick
  end
  object btnCancelar: TSpeedButton
    Left = 518
    Top = 302
    Width = 79
    Height = 25
    Caption = '&Cancelar'
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      333333333333333333333333000033338833333333333333333F333333333333
      0000333911833333983333333388F333333F3333000033391118333911833333
      38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
      911118111118333338F3338F833338F3000033333911111111833333338F3338
      3333F8330000333333911111183333333338F333333F83330000333333311111
      8333333333338F3333383333000033333339111183333333333338F333833333
      00003333339111118333333333333833338F3333000033333911181118333333
      33338333338F333300003333911183911183333333383338F338F33300003333
      9118333911183333338F33838F338F33000033333913333391113333338FF833
      38F338F300003333333333333919333333388333338FFF830000333333333333
      3333333333333333333888330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
    OnClick = btnCancelarClick
  end
  object btnGravar: TSpeedButton
    Left = 603
    Top = 302
    Width = 79
    Height = 25
    Caption = '&Gravar'
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333330000333333333333333333333333F33333333333
      00003333344333333333333333388F3333333333000033334224333333333333
      338338F3333333330000333422224333333333333833338F3333333300003342
      222224333333333383333338F3333333000034222A22224333333338F338F333
      8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
      33333338F83338F338F33333000033A33333A222433333338333338F338F3333
      0000333333333A222433333333333338F338F33300003333333333A222433333
      333333338F338F33000033333333333A222433333333333338F338F300003333
      33333333A222433333333333338F338F00003333333333333A22433333333333
      3338F38F000033333333333333A223333333333333338F830000333333333333
      333A333333333333333338330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
    OnClick = btnGravarClick
  end
  object btnNovaConexaoSerial: TSpeedButton
    Left = 153
    Top = 302
    Width = 131
    Height = 25
    Caption = '&Nova conex'#227'o Serial'
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000333300
      0000377777F3337777770FFFF099990FFFF07FFFF7FFFF7FFFF7000000999900
      00007777777777777777307703399330770337FF7F37F337FF7F300003399330
      000337777337F337777333333339933333333FFFFFF7F33FFFFF000000399300
      0000777777F7F37777770FFFF099990FFFF07FFFF7F7FF7FFFF7000000999900
      00007777777777777777307703399330770337FF7F37F337FF7F300003399330
      0003377773F7FFF77773331330000003333333333777777F3333331330FFFF03
      3333333337FFFF7F333311111000000333333333377777733333331333077033
      33333333337FF7F3333333133300003333333333337777333333}
    NumGlyphs = 2
    OnClick = btnNovaConexaoSerialClick
  end
  object DBGrid1: TDBGrid
    Left = 6
    Top = 2
    Width = 675
    Height = 292
    DataSource = DataSource
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Descricao'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Tipo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Porta'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Endereco'
        Visible = True
      end>
  end
  object kbmMemTable: TkbmMemTable
    FieldDefs = <
      item
        Name = 'Codigo'
        DataType = ftInteger
      end
      item
        Name = 'Tipo'
        DataType = ftInteger
      end
      item
        Name = 'Descricao'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'Endereco'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'Porta'
        DataType = ftInteger
      end
      item
        Name = 'BaudRate'
        DataType = ftInteger
      end
      item
        Name = 'DataBits'
        DataType = ftInteger
      end
      item
        Name = 'StopBits'
        DataType = ftInteger
      end
      item
        Name = 'ParityBits'
        DataType = ftInteger
      end
      item
        Name = 'FlowControl'
        DataType = ftInteger
      end
      item
        Name = 'LocalEcho'
        DataType = ftBoolean
      end>
    IndexFieldNames = 'Codigo'
    IndexName = 'kbmMemTableIndex1'
    IndexDefs = <
      item
        Name = 'kbmMemTableIndex1'
        Fields = 'Codigo'
      end>
    BeforeInsert = kbmMemTableBeforeInsert
    AfterInsert = kbmMemTableAfterInsert
    BeforePost = kbmMemTableBeforePost
    AfterScroll = kbmMemTableAfterScroll
    Left = 226
    Top = 79
    object kbmMemTableCodigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'Codigo'
      Visible = False
    end
    object kbmMemTableTipo: TIntegerField
      FieldName = 'Tipo'
      OnGetText = kbmMemTableTipoGetText
    end
    object kbmMemTableDescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'Descricao'
      Size = 60
    end
    object kbmMemTableEndereco: TStringField
      DisplayLabel = 'Endere'#231'o'
      FieldName = 'Endereco'
      Size = 100
    end
    object kbmMemTablePorta: TIntegerField
      FieldName = 'Porta'
      OnValidate = kbmMemTablePortaValidate
    end
    object kbmMemTableBaudRate: TIntegerField
      FieldName = 'BaudRate'
    end
    object kbmMemTableDataBits: TIntegerField
      FieldName = 'DataBits'
    end
    object kbmMemTableStopBits: TIntegerField
      FieldName = 'StopBits'
    end
    object kbmMemTableParityBits: TIntegerField
      FieldName = 'ParityBits'
    end
    object kbmMemTableFlowControl: TIntegerField
      FieldName = 'FlowControl'
    end
    object kbmMemTableLocalEcho: TBooleanField
      FieldName = 'LocalEcho'
    end
    object kbmMemTableFontName: TStringField
      FieldName = 'FontName'
      Size = 64
    end
    object kbmMemTableFontSize: TIntegerField
      FieldName = 'FontSize'
    end
    object kbmMemTableFontColor: TIntegerField
      FieldName = 'FontColor'
    end
    object kbmMemTableFontStyleBold: TBooleanField
      FieldName = 'FontStyleBold'
    end
    object kbmMemTableFontStyleItalic: TBooleanField
      FieldName = 'FontStyleItalic'
    end
    object kbmMemTableFontStyleUnderline: TBooleanField
      FieldName = 'FontStyleUnderline'
    end
    object kbmMemTableFontStyleStrikeOut: TBooleanField
      FieldName = 'FontStyleStrikeOut'
    end
    object kbmMemTableCR: TBooleanField
      FieldName = 'CR'
    end
  end
  object DataSource: TDataSource
    DataSet = kbmMemTable
    Left = 124
    Top = 76
  end
end
