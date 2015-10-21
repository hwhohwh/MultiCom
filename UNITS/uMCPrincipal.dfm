inherited FMCPrincipal: TFMCPrincipal
  Left = 258
  Top = 150
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'MultiCom'
  ClientHeight = 420
  ClientWidth = 653
  Menu = MainMenu
  OldCreateOrder = True
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  DesignSize = (
    653
    420)
  PixelsPerInch = 96
  TextHeight = 13
  object ComLabel7: TLabel
    Left = 509
    Top = 369
    Width = 25
    Height = 13
    Alignment = taRightJustify
    Anchors = [akLeft, akBottom]
    Caption = ' TX '
    Color = 16768185
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = True
    Layout = tlCenter
    Visible = False
  end
  object ComLabel6: TLabel
    Left = 463
    Top = 369
    Width = 26
    Height = 13
    Alignment = taRightJustify
    Anchors = [akLeft, akBottom]
    Caption = ' RX '
    Color = 16768185
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = True
    Layout = tlCenter
    Visible = False
  end
  object ComLabel5: TLabel
    Left = 398
    Top = 369
    Width = 42
    Height = 13
    Alignment = taRightJustify
    Anchors = [akLeft, akBottom]
    Caption = ' RLSD '
    Color = 16768185
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = True
    Layout = tlCenter
    Visible = False
  end
  object ComLabel4: TLabel
    Left = 342
    Top = 369
    Width = 35
    Height = 13
    Alignment = taRightJustify
    Anchors = [akLeft, akBottom]
    Caption = ' Ring '
    Color = 16768185
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = True
    Layout = tlCenter
    Visible = False
  end
  object ComLabel3: TLabel
    Left = 290
    Top = 369
    Width = 35
    Height = 13
    Alignment = taRightJustify
    Anchors = [akLeft, akBottom]
    Caption = ' DSR '
    Color = 16768185
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = True
    Layout = tlCenter
    Visible = False
  end
  object ComLabel2: TLabel
    Left = 237
    Top = 369
    Width = 33
    Height = 13
    Alignment = taRightJustify
    Anchors = [akLeft, akBottom]
    Caption = ' CTS '
    Color = 16768185
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = True
    Layout = tlCenter
    Visible = False
  end
  object ComLabel1: TLabel
    Left = 181
    Top = 369
    Width = 38
    Height = 13
    Alignment = taRightJustify
    Anchors = [akLeft, akBottom]
    Caption = ' Conn '
    Color = 16768185
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = True
    Layout = tlCenter
    Visible = False
  end
  object btnConectar: TSpeedButton
    Left = 4
    Top = 391
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = '&Conectar'
    OnClick = btnConectarClick
  end
  object btnDesconectar: TSpeedButton
    Left = 90
    Top = 391
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = '&Desconectar'
    Enabled = False
    OnClick = btnDesconectarClick
  end
  object lblHost: TLabel
    Left = 178
    Top = 398
    Width = 25
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = '&Host:'
    FocusControl = edtHost
  end
  object lblLocalEcho: TLabel
    Left = 4
    Top = 368
    Width = 73
    Height = 16
    Anchors = [akLeft, akBottom]
    Caption = ' Local Echo '
    Color = clRed
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Transparent = False
    Layout = tlCenter
    Visible = False
  end
  object ComLed1: TComLed
    Left = 167
    Top = 368
    Width = 15
    Height = 15
    LedSignal = lsConn
    Kind = lkRedLight
    RingDuration = 0
    Visible = False
    Anchors = [akLeft, akBottom]
  end
  object ComLed2: TComLed
    Left = 222
    Top = 368
    Width = 15
    Height = 15
    ComPort = ComPort
    LedSignal = lsCTS
    Kind = lkYellowLight
    RingDuration = 0
    Visible = False
    Anchors = [akLeft, akBottom]
  end
  object ComLed3: TComLed
    Left = 275
    Top = 368
    Width = 15
    Height = 15
    ComPort = ComPort
    LedSignal = lsDSR
    Kind = lkGreenLight
    RingDuration = 0
    Visible = False
    Anchors = [akLeft, akBottom]
  end
  object ComLed4: TComLed
    Left = 327
    Top = 368
    Width = 15
    Height = 15
    ComPort = ComPort
    LedSignal = lsRing
    Kind = lkRedLight
    RingDuration = 0
    Visible = False
    Anchors = [akLeft, akBottom]
  end
  object ComLed5: TComLed
    Left = 382
    Top = 368
    Width = 15
    Height = 15
    ComPort = ComPort
    LedSignal = lsRLSD
    Kind = lkPurpleLight
    RingDuration = 0
    Visible = False
    Anchors = [akLeft, akBottom]
  end
  object ComLed6: TComLed
    Left = 447
    Top = 368
    Width = 15
    Height = 15
    ComPort = ComPort
    LedSignal = lsRx
    Kind = lkYellowLight
    RingDuration = 0
    Visible = False
    Anchors = [akLeft, akBottom]
  end
  object ComLed7: TComLed
    Left = 493
    Top = 368
    Width = 15
    Height = 15
    ComPort = ComPort
    LedSignal = lsTx
    Kind = lkGreenLight
    RingDuration = 0
    Visible = False
    Anchors = [akLeft, akBottom]
  end
  object lblCR_LF: TLabel
    Left = 80
    Top = 368
    Width = 49
    Height = 16
    Anchors = [akLeft, akBottom]
    Caption = ' CR+LF '
    Color = clGreen
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Transparent = False
    Visible = False
  end
  object lblTec: TLabel
    Left = 562
    Top = 370
    Width = 29
    Height = 13
    Caption = 'lblTec'
  end
  object ComTerminal: TComTerminal
    Left = 4
    Top = 4
    Width = 644
    Height = 364
    Color = clBlack
    ComPort = ComPort
    Emulation = teVT100orANSI
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -12
    Font.Name = 'Fixedsys'
    Font.Style = []
    LocalEcho = True
    ScrollBars = ssBoth
    TabOrder = 0
    Anchors = [akLeft, akTop, akRight, akBottom]
    AutoSize = True
    OnKeyPress = ComTerminalKeyPress
    OnResize = ComTerminalResize
  end
  object edtHost: TComboBox
    Left = 206
    Top = 395
    Width = 329
    Height = 21
    Anchors = [akLeft, akBottom]
    ItemHeight = 13
    TabOrder = 1
    OnExit = edtHostExit
  end
  object chkLogar: TCheckBox
    Left = 540
    Top = 397
    Width = 97
    Height = 17
    Anchors = [akLeft, akBottom]
    Caption = 'Log'
    TabOrder = 2
    OnClick = chkLogarClick
  end
  object IdTelnet: TIdTelnet
    MaxLineAction = maException
    ReadTimeout = 0
    OnDisconnected = IdTelnetDisconnected
    Host = '200.207.158.216'
    OnConnected = IdTelnetConnected
    Port = 23
    OnDataAvailable = IdTelnetDataAvailable
    Terminal = 'ISTerminal'
    Left = 204
    Top = 32
  end
  object MainMenu: TMainMenu
    Left = 276
    Top = 30
    object mnConfigurar: TMenuItem
      Caption = 'C&onfigurar'
      object smnTerminal: TMenuItem
        Caption = '&Terminal'
        object smnParametros: TMenuItem
          Caption = '&Par'#226'metros'
          OnClick = smnParametrosClick
        end
        object smnFonte: TMenuItem
          Caption = '&Fonte'
          OnClick = smnFonteClick
        end
      end
      object smnConexoes: TMenuItem
        Caption = '&Conex'#245'es'
        OnClick = smnConexoesClick
      end
    end
    object mnSair: TMenuItem
      Caption = 'Sai&r'
      OnClick = mnSairClick
    end
  end
  object ComPort: TComPort
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
    OnAfterOpen = ComPortAfterOpen
    OnAfterClose = ComPortAfterClose
    OnRxBuf = ComPortRxBuf
    Left = 236
    Top = 31
  end
end
