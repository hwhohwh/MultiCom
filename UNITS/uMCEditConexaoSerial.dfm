inherited FMCEditConexaoSerial: TFMCEditConexaoSerial
  Left = 403
  Top = 294
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Conex'#227'o Serial'
  ClientHeight = 241
  ClientWidth = 311
  OldCreateOrder = True
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object btnCancelar: TSpeedButton
    Left = 122
    Top = 213
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
    Left = 226
    Top = 213
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
  object Label2: TLabel
    Left = 3
    Top = 5
    Width = 48
    Height = 13
    Caption = 'Descri'#231#227'o'
    FocusControl = Descricao
  end
  object Label1: TLabel
    Left = 4
    Top = 48
    Width = 25
    Height = 13
    Caption = 'Porta'
  end
  object Label3: TLabel
    Left = 4
    Top = 72
    Width = 46
    Height = 13
    Caption = 'Baud rate'
  end
  object Label4: TLabel
    Left = 4
    Top = 96
    Width = 42
    Height = 13
    Caption = 'Data bits'
  end
  object Label5: TLabel
    Left = 4
    Top = 120
    Width = 41
    Height = 13
    Caption = 'Stop bits'
  end
  object Label6: TLabel
    Left = 4
    Top = 144
    Width = 42
    Height = 13
    Caption = 'Paridade'
  end
  object Label7: TLabel
    Left = 4
    Top = 168
    Width = 79
    Height = 13
    Caption = 'Controle de fluxo'
  end
  object Descricao: TDBEdit
    Left = 3
    Top = 19
    Width = 305
    Height = 21
    DataField = 'Descricao'
    DataSource = FMCConexoes.DataSource
    TabOrder = 0
  end
  object cmbBaudRate: TComComboBox
    Left = 86
    Top = 68
    Width = 85
    Height = 21
    ComPort = ConfComPort
    ComProperty = cpBaudRate
    Text = '9600'
    Style = csDropDownList
    ItemHeight = 13
    ItemIndex = 7
    TabOrder = 2
  end
  object cmbDataBits: TComComboBox
    Left = 86
    Top = 92
    Width = 45
    Height = 21
    ComPort = ConfComPort
    ComProperty = cpDataBits
    Text = '8'
    Style = csDropDownList
    ItemHeight = 13
    ItemIndex = 3
    TabOrder = 3
  end
  object cmbStopBits: TComComboBox
    Left = 86
    Top = 116
    Width = 45
    Height = 21
    ComPort = ConfComPort
    ComProperty = cpStopBits
    Text = '1'
    Style = csDropDownList
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 4
  end
  object cmbParity: TComComboBox
    Left = 86
    Top = 140
    Width = 129
    Height = 21
    ComPort = ConfComPort
    ComProperty = cpParity
    Text = 'None'
    Style = csDropDownList
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 5
  end
  object cmbFlowControl: TComComboBox
    Left = 86
    Top = 164
    Width = 129
    Height = 21
    ComPort = ConfComPort
    ComProperty = cpFlowControl
    Text = 'None'
    Style = csDropDownList
    ItemHeight = 13
    ItemIndex = 2
    TabOrder = 6
  end
  object cmbPorta: TComComboBox
    Left = 86
    Top = 44
    Width = 67
    Height = 21
    ComPort = ConfComPort
    ComProperty = cpPort
    Text = 'COM1'
    Style = csDropDownList
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 1
  end
  object chkLocalEcho: TCheckBox
    Left = 4
    Top = 190
    Width = 95
    Height = 17
    Alignment = taLeftJustify
    Caption = 'Local Echo'
    TabOrder = 7
  end
  object chkCRLF: TDBCheckBox
    Left = 155
    Top = 190
    Width = 55
    Height = 17
    Caption = 'CR/LF'
    DataField = 'CR'
    DataSource = FMCConexoes.DataSource
    TabOrder = 8
    ValueChecked = 'True'
    ValueUnchecked = 'False'
    OnClick = chkCRLFClick
  end
  object ConfComPort: TComPort
    BaudRate = br9600
    Port = 'COM1'
    Parity.Bits = prNone
    StopBits = sbOneStopBit
    DataBits = dbEight
    Events = [evRxChar, evTxEmpty, evRxFlag, evRing, evBreak, evCTS, evDSR, evError, evRLSD, evRx80Full]
    FlowControl.OutCTSFlow = False
    FlowControl.OutDSRFlow = False
    FlowControl.ControlDTR = dtrDisable
    FlowControl.ControlRTS = rtsDisable
    FlowControl.XonXoffOut = False
    FlowControl.XonXoffIn = False
    Left = 230
    Top = 10
  end
end
