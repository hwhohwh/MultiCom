unit uMCPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Menus, IniFiles, uFormPadrao, CPort, CPortTypes,
  CPortCtl, IdIntercept, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdTelnet;

type
  TFMCPrincipal = class(TFormPadrao)
    ComTerminal: TComTerminal;
    IdTelnet: TIdTelnet;
    btnConectar: TSpeedButton;
    btnDesconectar: TSpeedButton;
    edtHost: TComboBox;
    lblHost: TLabel;
    MainMenu: TMainMenu;
    mnSair: TMenuItem;
    mnConfigurar: TMenuItem;
    ComPort: TComPort;
    smnTerminal: TMenuItem;
    smnConexoes: TMenuItem;
    smnFonte: TMenuItem;
    smnParametros: TMenuItem;
    lblLocalEcho: TLabel;
    ComLed1: TComLed;
    ComLed2: TComLed;
    ComLed3: TComLed;
    ComLed4: TComLed;
    ComLed5: TComLed;
    ComLed6: TComLed;
    ComLed7: TComLed;
    ComLabel1: TLabel;
    ComLabel2: TLabel;
    ComLabel3: TLabel;
    ComLabel4: TLabel;
    ComLabel5: TLabel;
    ComLabel6: TLabel;
    ComLabel7: TLabel;
    lblCR_LF: TLabel;
    lblTec: TLabel;
    chkLogar: TCheckBox;
    procedure IdTelnetDataAvailable(Sender: TIdTelnet; const Buffer: string);
    procedure btnConectarClick(Sender: TObject);
    procedure IdTelnetDisconnected(Sender: TObject);
    procedure IdTelnetConnected(Sender: TObject);
    procedure ComTerminalKeyPress(Sender: TObject; var Key: Char);
    procedure btnDesconectarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ComTerminalResize(Sender: TObject);
    procedure mnSairClick(Sender: TObject);
    procedure edtHostExit(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ComPortAfterClose(Sender: TObject);
    procedure ComPortAfterOpen(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure smnConexoesClick(Sender: TObject);
    procedure smnFonteClick(Sender: TObject);
    procedure smnParametrosClick(Sender: TObject);
    procedure ComPortRxBuf(Sender: TObject; const Buffer: PAnsiChar; Count: Integer);
    procedure chkLogarClick(Sender: TObject);
  private
    FCanLog: Boolean;
    procedure LeParametros;
    procedure HabilitaTCPIP;
    procedure HabilitaSerial;
    procedure Inicializa;
    procedure Limpa;
  public
    procedure AtualizaServidores;
  end;

var
  FMCPrincipal: TFMCPrincipal;

implementation

uses
  uMCDefs, uMCConexoes, uMCConfTerminal;

{$R *.dfm}

procedure TFMCPrincipal.IdTelnetConnected(Sender: TObject);
begin
  HabilitaTCPIP;

  if chkLogar.Checked then
  begin
    AssignFile(F1, IdTelnet.Host);
    Rewrite(F1);
    FCanLog := True;
  end;

  Inicializa;
end;

procedure TFMCPrincipal.IdTelnetDataAvailable(Sender: TIdTelnet; const Buffer: string);
begin
  ComTerminal.WriteStr(Buffer);

  if FCanLog then
    Write(F1, Buffer);
end;

procedure TFMCPrincipal.IdTelnetDisconnected(Sender: TObject);
begin
  Limpa;
  HabilitaTCPIP;

  if chkLogar.Checked then
  begin
    CloseFile(F1);
    FCanLog := False;
  end;
end;

procedure TFMCPrincipal.ComPortAfterOpen(Sender: TObject);
begin
  HabilitaSerial;

  if chkLogar.Checked then
  begin
    AssignFile(F1, IdTelnet.Host);
    Rewrite(F1);
    FCanLog := True;
  end;

  Inicializa;
end;

procedure TFMCPrincipal.ComPortRxBuf(Sender: TObject; const Buffer: PAnsiChar; Count: Integer);
begin
  if FCanLog then
    Write(F1, Buffer);
end;

procedure TFMCPrincipal.ComPortAfterClose(Sender: TObject);
begin
  Limpa;
  HabilitaSerial;

  if chkLogar.Checked then
  begin
    CloseFile(F1);
    FCanLog := False;
  end;
end;

procedure TFMCPrincipal.btnConectarClick(Sender: TObject);
var
  i: Integer;
begin
  i := edtHost.ItemIndex;
  ComTerminal.LocalEcho := FComsLocalEcho[i];

  ComTerminal.Font.Name := FFontsName[i];
  ComTerminal.Font.Size := FFontsSize[i];
  ComTerminal.Font.Color := FFontsColor[i];
  ComTerminal.Font.Style := [];

  if FFontsStyleBold[i] then
    ComTerminal.Font.Style := ComTerminal.Font.Style + [fsBold];

  if FFontsStyleItalic[i] then
    ComTerminal.Font.Style := ComTerminal.Font.Style + [fsItalic];

  if FFontsStyleUnderline[i] then
    ComTerminal.Font.Style := ComTerminal.Font.Style + [fsUnderline];

  if FFontsStyleStrikeOut[i] then
    ComTerminal.Font.Style := ComTerminal.Font.Style + [fsStrikeOut];

  if FTypes[i] = 0 then
  begin
    IdTelnet.Host := FHosts[i];
    IdTelnet.Port := FPorts[i];
    IdTelnet.Connect;
  end
  else if FTypes[i] = 2 then
  begin
    ComPort.Port := ToPort(FPorts[i]);
    ComPort.Connected := True;
  end;
end;

procedure TFMCPrincipal.ComTerminalKeyPress(Sender: TObject; var Key: Char);
begin
  if FTypes[edtHost.ItemIndex] = 0 then
  begin
    if (Key <> #13) or ((Key = #13) and FCR_LF[edtHost.ItemIndex]) then
      IdTelnet.Write(Key)
    else
      IdTelnet.Write(#10);

    if ComTerminal.LocalEcho then
      ComTerminal.WriteStr(Key);
  end;

  lblTec.Caption := IntToStr(Ord(Key));
end;

procedure TFMCPrincipal.btnDesconectarClick(Sender: TObject);
begin
  if IdTelnet.Connected then
    IdTelnet.Disconnect
  else if ComPort.Connected then
    ComPort.Connected := False;
end;

procedure TFMCPrincipal.HabilitaTCPIP;
begin
  lblLocalEcho.Visible := False;
  lblCR_LF.Visible := False;
  btnConectar.Enabled := not IdTelnet.Connected;
  btnDesconectar.Enabled := IdTelnet.Connected;
  lblHost.Enabled := btnConectar.Enabled;
  edtHost.Enabled := btnConectar.Enabled;
  mnConfigurar.Enabled := btnConectar.Enabled;
  chkLogar.Enabled := btnConectar.Enabled;

  Caption := 'Terminal - ';

  if btnConectar.Enabled then
    Caption := Caption + 'desconectado'
  else
    Caption := Caption + 'conectado em ' + Trim(edtHost.Text) + ' : ' +
      IntToStr(FPorts[edtHost.ItemIndex]);

  if IdTelnet.Connected then
  begin
    ComLed1.ComPort := nil;
    ComLed1.State := lsOn;
  end
  else
  begin
    ComLed1.State := lsOff;
    ComLed1.ComPort := ComPort;
  end;

  ComLed1.Visible := IdTelnet.Connected;
  ComLabel1.Visible := ComLed1.Visible;

  Invalidate;
end;

procedure TFMCPrincipal.FormCreate(Sender: TObject);
begin
  lblTec.Caption := '';

  ComLabel1.SendToBack;
  ComLabel1.AutoSize := True;
  ComLabel1.AutoSize := False;
  ComLabel1.Width := ComLed1.Width + ComLabel1.Width;
  ComLabel1.Height := ComLed1.Height;
  ComLabel1.Left := ComLed1.Left;

  ComLed2.Left := ComLabel1.Left + ComLabel1.Width + 3;
  ComLabel2.SendToBack;
  ComLabel2.AutoSize := True;
  ComLabel2.AutoSize := False;
  ComLabel2.Width := ComLed2.Width + ComLabel2.Width;
  ComLabel2.Height := ComLed2.Height;
  ComLabel2.Left := ComLed2.Left;

  ComLed3.Left := ComLabel2.Left + ComLabel2.Width + 3;
  ComLabel3.SendToBack;
  ComLabel3.AutoSize := True;
  ComLabel3.AutoSize := False;
  ComLabel3.Width := ComLed3.Width + ComLabel3.Width;
  ComLabel3.Height := ComLed3.Height;
  ComLabel3.Left := ComLed3.Left;

  ComLed4.Left := ComLabel3.Left + ComLabel3.Width + 3;
  ComLabel4.SendToBack;
  ComLabel4.AutoSize := True;
  ComLabel4.AutoSize := False;
  ComLabel4.Width := ComLed4.Width + ComLabel4.Width;
  ComLabel4.Height := ComLed4.Height;
  ComLabel4.Left := ComLed4.Left;

  ComLed5.Left := ComLabel4.Left + ComLabel4.Width + 3;
  ComLabel5.SendToBack;
  ComLabel5.AutoSize := True;
  ComLabel5.AutoSize := False;
  ComLabel5.Width := ComLed5.Width + ComLabel5.Width;
  ComLabel5.Height := ComLed5.Height;
  ComLabel5.Left := ComLed5.Left;

  ComLed6.Left := ComLabel5.Left + ComLabel5.Width + 3;
  ComLabel6.SendToBack;
  ComLabel6.AutoSize := True;
  ComLabel6.AutoSize := False;
  ComLabel6.Width := ComLed6.Width + ComLabel6.Width;
  ComLabel6.Height := ComLed6.Height;
  ComLabel6.Left := ComLed6.Left;

  ComLed7.Left := ComLabel6.Left + ComLabel6.Width + 3;
  ComLabel7.SendToBack;
  ComLabel7.AutoSize := True;
  ComLabel7.AutoSize := False;
  ComLabel7.Width := ComLed7.Width + ComLabel7.Width;
  ComLabel7.Height := ComLed7.Height;
  ComLabel7.Left := ComLed7.Left;

  FCaret := Integer(tcBlock);
  FLocalEcho := False;
  FPath := ExtractFilePath(Application.ExeName);
  LeParametros;
  AtualizaServidores;
  Limpa;
  HabilitaTCPIP;
end;

procedure TFMCPrincipal.ComTerminalResize(Sender: TObject);
begin
  ClientWidth := ComTerminal.Width + ComTerminal.Left;
  ClientHeight := ComTerminal.Top + ComTerminal.Height + 36 + lblLocalEcho.Height;
end;

procedure TFMCPrincipal.mnSairClick(Sender: TObject);
begin
  if btnDesconectar.Enabled then
    btnDesconectar.Click;

  Application.Terminate;
end;

procedure TFMCPrincipal.edtHostExit(Sender: TObject);
begin
  TEdit(Sender).Text := Trim(TEdit(Sender).Text);
end;

procedure TFMCPrincipal.Limpa;
begin
  if ComTerminal <> nil then
  begin
    ComTerminal.Caret := tcNone;
    ComTerminal.ClearScreen;
    ComTerminal.WriteStr('Desconectado.');
  end;

  lblLocalEcho.Visible := False;
  lblCR_LF.Visible := False;
end;

procedure TFMCPrincipal.FormDestroy(Sender: TObject);
begin
  with TIniFile.Create(FPath + 'MultiCom.ini') do
  try
    WriteInteger('Connections', 'Current', edtHost.ItemIndex + 1);
    UpdateFile;
  finally
    Free;
  end;
end;

procedure TFMCPrincipal.HabilitaSerial;
begin
  btnConectar.Enabled := not ComPort.Connected;
  btnDesconectar.Enabled := ComPort.Connected;
  lblHost.Enabled := btnConectar.Enabled;
  edtHost.Enabled := btnConectar.Enabled;
  mnConfigurar.Enabled := btnConectar.Enabled;
  chkLogar.Enabled := btnConectar.Enabled;

  Caption := 'Terminal - ';

  if btnConectar.Enabled then
    Caption := Caption + 'desconectado'
  else
    Caption := Caption + 'conectado em ' + Trim(edtHost.Text);

  ComLed1.Visible := ComPort.Connected;
  ComLabel1.Visible := ComLed1.Visible;
  ComLed2.Visible := ComLed1.Visible;
  ComLabel2.Visible := ComLed1.Visible;
  ComLed3.Visible := ComLed1.Visible;
  ComLabel3.Visible := ComLed1.Visible;
  ComLed4.Visible := ComLed1.Visible;
  ComLabel4.Visible := ComLed1.Visible;
  ComLed5.Visible := ComLed1.Visible;
  ComLabel5.Visible := ComLed1.Visible;
  ComLed6.Visible := ComLed1.Visible;
  ComLabel6.Visible := ComLed1.Visible;
  ComLed7.Visible := ComLed1.Visible;
  ComLabel7.Visible := ComLed1.Visible;

  Invalidate;
end;

procedure TFMCPrincipal.Inicializa;
begin
  ComTerminal.ClearScreen;
  ComTerminal.Caret := TTermCaret(FCaret);
  ComTerminal.SetFocus;

  lblLocalEcho.Visible := True;

  if FCR_LF[edtHost.ItemIndex] then
  begin
    lblCR_LF.Caption := ' CR ';
    lblCR_LF.Color := clGreen;
  end
  else
  begin
    lblCR_LF.Caption := ' LF ';
    lblCR_LF.Color := clBlue;
  end;

  lblCR_LF.Visible := True;

  if ComTerminal.LocalEcho then
    lblLocalEcho.Color := clRed
  else
    lblLocalEcho.Color := clSilver;
end;

procedure TFMCPrincipal.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if btnDesconectar.Enabled then
    btnDesconectar.Click;
end;

procedure TFMCPrincipal.smnConexoesClick(Sender: TObject);
begin
  if FMCConexoes.ShowModal = mrOk then
    AtualizaServidores;
end;

procedure TFMCPrincipal.AtualizaServidores;
var
  i: Integer;
  s: string;
begin
  edtHost.Clear;

  with TIniFile.Create(FPath + 'MultiCom.ini') do
  try
    FNumConnections := ReadInteger('Connections', 'Connections', 0);

    SetLength(FNames, FNumConnections);
    SetLength(FTypes, FNumConnections);
    SetLength(FHosts, FNumConnections);
    SetLength(FPorts, FNumConnections);
    SetLength(FCR_LF, FNumConnections);
    SetLength(FComsPort, FNumConnections);
    SetLength(FComsBaudRate, FNumConnections);
    SetLength(FComsDataBits, FNumConnections);
    SetLength(FComsStopBits, FNumConnections);
    SetLength(FComsParityBits, FNumConnections);
    SetLength(FComsFlowControl, FNumConnections);
    SetLength(FComsLocalEcho, FNumConnections);
    SetLength(FFontsName, FNumConnections);
    SetLength(FFontsSize, FNumConnections);
    SetLength(FFontsColor, FNumConnections);
    SetLength(FFontsStyleBold, FNumConnections);
    SetLength(FFontsStyleItalic, FNumConnections);
    SetLength(FFontsStyleUnderline, FNumConnections);
    SetLength(FFontsStyleStrikeOut, FNumConnections);

    if FNumConnections > 0 then
    begin
      for i := 0 to FNumConnections - 1 do
      begin
        FNames[i] := ReadString('Connections', IntToStr(i + 1), '');
        FTypes[i] := ReadInteger(FNames[i], 'Type', 1);
        FPorts[i] := ReadInteger(FNames[i], 'Port', 0);
        FCR_LF[i] := ReadBool(FNames[i], 'CR', True);

        if FTypes[i] = 0 then
          FHosts[i] := ReadString(FNames[i], 'Host', '')
        else if FTypes[i] = 2 then
        begin
          FComsBaudRate[i] := TBaudRate(ReadInteger(FNames[i], 'BaudRate', 0));
          FComsDataBits[i] := TDataBits(ReadInteger(FNames[i], 'DataBits', 0));
          FComsStopBits[i] := TStopBits(ReadInteger(FNames[i], 'StopBits', 0));
          FComsParityBits[i] := TParityBits(ReadInteger(FNames[i], 'ParityBits', 0));
          FComsFlowControl[i] := TFlowControl(ReadInteger(FNames[i], 'FlowControl', 0));
        end;

        FComsLocalEcho[i] := ReadBool(FNames[i], 'LocalEcho', False);

        FFontsName[i] := ReadString(FNames[i], 'FontName', FFontName);
        FFontsSize[i] := ReadInteger(FNames[i], 'FontSize', FFontSize);
        FFontsColor[i] := TColor(ReadInteger(FNames[i], 'FontColor', Integer(FFontColor)));
        FFontsStyleBold[i] := ReadBool(FNames[i], 'FontStyleBold', FFontStyleBold);
        FFontsStyleItalic[i] := ReadBool(FNames[i], 'FontStyleItalic', FFontStyleItalic);
        FFontsStyleUnderline[i] := ReadBool(FNames[i], 'FontStyleUnderline', FFontStyleUnderline);
        FFontsStyleStrikeOut[i] := ReadBool(FNames[i], 'FontStyleStrikeOut', FFontStyleStrikeOut);

        s := FNames[i] + ' (' + FHosts[i];

        if FTypes[i] = 0 then
          s := s + ':' + IntToStr(FPorts[i])
        else if FTypes[i] = 0 then
          s := s + ToPort(FPorts[i]);

        s := s + ')';

        edtHost.Items.Add(s);
      end;

      edtHost.ItemIndex := ReadInteger('Connections', 'Current', 1) - 1;
    end;
  finally
    Free;
  end;
end;

procedure TFMCPrincipal.smnFonteClick(Sender: TObject);
begin
  FMCConfTerminal.ConfigFont;
  LeParametros;
end;

procedure TFMCPrincipal.smnParametrosClick(Sender: TObject);
begin
  FMCConfTerminal.ConfigTerminal;
end;

procedure TFMCPrincipal.LeParametros;
begin
  with TIniFile.Create(FPath + 'MultiCom.ini') do
  try
    ComTerminal.Rows := ReadInteger('Terminal', 'Rows', 24);
    ComTerminal.Columns := ReadInteger('Terminal', 'Columns', 80);
    FLocalEcho := ReadBool('Terminal', 'LocalEcho', False);
    FSendLF := ReadBool('Terminal', 'SendLF', False);
    FSendWrapLines := ReadBool('Terminal', 'WrapLines', False);
    FForce7Bit := ReadBool('Terminal', 'Force7Bit', False);
    FAppendLF := ReadBool('Terminal', 'AppendLF', False);
    FCaret := ReadInteger('Terminal', 'Caret', Integer(tcBlock));
    FEmulation := ReadInteger('Terminal', 'Emulation', Integer(teVT100orANSI));
    FArrowKeys := ReadInteger('Terminal', 'ArrowKeys', Integer(akTerminal));

    FFontName := ReadString('Terminal', 'FontName', ComTerminalFont.Name);
    FFontSize := ReadInteger('Terminal', 'FontSize', ComTerminalFont.Size);
    FFontColor := TColor(ReadInteger('Terminal', 'FontColor', Integer(ComTerminalFont.Color)));

    FFontStyleBold := ReadBool('Terminal', 'FontStyleBold', fsBold in ComTerminalFont.Style);
    FFontStyleItalic := ReadBool('Terminal', 'FontStyleItalic', fsItalic in ComTerminalFont.Style);
    FFontStyleUnderline := ReadBool('Terminal', 'FontStyleUnderline', fsUnderline in ComTerminalFont.Style);
    FFontStyleStrikeOut := ReadBool('Terminal', 'FontStyleStrikeOut', fsStrikeOut in ComTerminalFont.Style);

    ComTerminal.Font.Name := FFontName;
    ComTerminal.Font.Size := FFontSize;
    ComTerminal.Font.Color := FFontColor;
    ComTerminal.Font.Style := [];

    if FFontStyleBold then
      ComTerminal.Font.Style := ComTerminal.Font.Style + [fsBold];
    if FFontStyleItalic then
      ComTerminal.Font.Style := ComTerminal.Font.Style + [fsItalic];
    if FFontStyleUnderline then
      ComTerminal.Font.Style := ComTerminal.Font.Style + [fsUnderline];
    if FFontStyleStrikeOut then
      ComTerminal.Font.Style := ComTerminal.Font.Style + [fsStrikeOut];

    FComPort := ReadInteger('ComDefs', 'Port', 0);
    FComBaudRate := TBaudRate(ReadInteger('ComDefs', 'BaudRate', 0));
    FComDataBits := TDataBits(ReadInteger('ComDefs', 'DataBits', 0));
    FComStopBits := TStopBits(ReadInteger('ComDefs', 'StopBits', 0));
    FComParity := TParityBits(ReadInteger('ComDefs', 'ParityBits', 0));
    FComFlowControl := TFlowControl(ReadInteger('ComDefs', 'FlowControl', 0));

    chkLogar.OnClick := nil;

    try
      chkLogar.Checked := ReadBool('General', 'Log', False);
    finally
      chkLogar.OnClick := chkLogarClick;
    end;
  finally
    Free;
  end;
end;

procedure TFMCPrincipal.chkLogarClick(Sender: TObject);
begin
  with TIniFile.Create(FPath + 'MultiCom.ini') do
  try
    WriteBool('General', 'Log', chkLogar.Checked);
  finally
    UpdateFile;
    Free;
  end;
end;

end.

