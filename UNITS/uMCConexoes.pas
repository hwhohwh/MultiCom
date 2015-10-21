unit uMCConexoes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, kbmMemTable, Grids, DBGrids, StdCtrls, Buttons, IniFiles, CPort,
  CPortTypes, uFormPadrao;

type
  TFMCConexoes = class(TFormPadrao)
    kbmMemTable: TkbmMemTable;
    DataSource: TDataSource;
    kbmMemTableCodigo: TIntegerField;
    kbmMemTableTipo: TIntegerField;
    kbmMemTableDescricao: TStringField;
    kbmMemTableEndereco: TStringField;
    kbmMemTablePorta: TIntegerField;
    DBGrid1: TDBGrid;
    btnNovaConexaoTelnet: TSpeedButton;
    btnExcluir: TSpeedButton;
    btnCancelar: TSpeedButton;
    btnGravar: TSpeedButton;
    btnAlterar: TSpeedButton;
    kbmMemTableBaudRate: TIntegerField;
    kbmMemTableDataBits: TIntegerField;
    kbmMemTableStopBits: TIntegerField;
    kbmMemTableParityBits: TIntegerField;
    kbmMemTableFlowControl: TIntegerField;
    btnNovaConexaoSerial: TSpeedButton;
    kbmMemTableLocalEcho: TBooleanField;
    kbmMemTableFontName: TStringField;
    kbmMemTableFontSize: TIntegerField;
    kbmMemTableFontColor: TIntegerField;
    kbmMemTableFontStyleBold: TBooleanField;
    kbmMemTableFontStyleItalic: TBooleanField;
    kbmMemTableFontStyleUnderline: TBooleanField;
    kbmMemTableFontStyleStrikeOut: TBooleanField;
    kbmMemTableCR: TBooleanField;
    procedure kbmMemTableTipoGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure FormShow(Sender: TObject);
    procedure kbmMemTableAfterScroll(DataSet: TDataSet);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure kbmMemTableBeforeInsert(DataSet: TDataSet);
    procedure kbmMemTableAfterInsert(DataSet: TDataSet);
    procedure btnNovaConexaoTelnetClick(Sender: TObject);
    procedure kbmMemTablePortaValidate(Sender: TField);
    procedure btnGravarClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure kbmMemTableBeforePost(DataSet: TDataSet);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnNovaConexaoSerialClick(Sender: TObject);
  private
    FCodigo: Integer;
    FAlterado: Boolean;
  public
  end;

var
  FMCConexoes: TFMCConexoes;

implementation

uses
  uMCDefs, uMCEditConexaoTelnet, uMCEditConexaoSerial;

{$R *.dfm}

procedure TFMCConexoes.kbmMemTableTipoGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if Sender.Value = 0 then
    Text := 'Telnet'
  else if Sender.Value = 2 then
    Text := 'Serial';
end;

procedure TFMCConexoes.FormShow(Sender: TObject);
var
  i: Integer;
begin
  with kbmMemTable do
  begin
    Open;
    EmptyTable;

    if FNumConnections > 0 then
    begin
      for i := 0 to FNumConnections - 1 do
      begin
        Append;

        try
          kbmMemTableCodigo.AsInteger := i + 1;
          kbmMemTableDescricao.AsString := FNames[i];
          kbmMemTablePorta.AsInteger := FPorts[i];
          kbmMemTableCR.AsBoolean := FCR_LF[i];

          if FTypes[i] = 0 then
            kbmMemTableEndereco.AsString := FHosts[i]
          else if FTypes[i] = 2 then
          begin
            kbmMemTableBaudRate.AsInteger := Integer(FComsBaudRate[i]);
            kbmMemTableDataBits.AsInteger := Integer(FComsDataBits[i]);
            kbmMemTableStopBits.AsInteger := Integer(FComsStopBits[i]);
            kbmMemTableParityBits.AsInteger := Integer(FComsParityBits[i]);
            kbmMemTableFlowControl.AsInteger := Integer(FComsFlowControl[i]);
          end;

          kbmMemTableLocalEcho.AsBoolean := FComsLocalEcho[i];

          kbmMemTableFontName.AsString := FFontsName[i];
          kbmMemTableFontSize.AsInteger := FFontsSize[i];
          kbmMemTableFontColor.AsInteger := Integer(FFontsColor[i]);
          kbmMemTableFontStyleBold.AsBoolean := FFontsStyleBold[i];
          kbmMemTableFontStyleItalic.AsBoolean := FFontsStyleItalic[i];
          kbmMemTableFontStyleUnderline.AsBoolean := FFontsStyleUnderline[i];
          kbmMemTableFontStyleStrikeOut.AsBoolean := FFontsStyleStrikeOut[i];
          kbmMemTableTipo.AsInteger := FTypes[i];

          Post;
        except
          Cancel;
          raise;
        end;
      end;

      First;
      FAlterado := False;
    end;
  end;
end;

procedure TFMCConexoes.kbmMemTableAfterScroll(DataSet: TDataSet);
begin
  btnAlterar.Enabled := not (DataSet.BOF and DataSet.EOF);
  btnExcluir.Enabled := btnAlterar.Enabled;
end;

procedure TFMCConexoes.btnCancelarClick(Sender: TObject);
begin
  if (not FAlterado) or (FAlterado and (MessageBox(Handle,
    'Confirme o cancelamento..', 'Confirmação', MB_YESNO +
    MB_ICONINFORMATION + MB_DEFBUTTON2) = IDYES)) then
    ModalResult := mrCancel;
end;

procedure TFMCConexoes.btnExcluirClick(Sender: TObject);
begin
  if MessageBox(Handle, 'Confirme a exclusão..', 'Confirmação', MB_YESNO +
    MB_ICONINFORMATION + MB_DEFBUTTON2) = IDYES then
    kbmMemTable.Delete;
end;

procedure TFMCConexoes.kbmMemTableBeforeInsert(DataSet: TDataSet);
begin
  DataSet.Last;
  FCodigo := DataSet.FieldByName('Codigo').AsInteger + 1;
end;

procedure TFMCConexoes.kbmMemTableAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('Codigo').AsInteger := FCodigo;
  DataSet.FieldByName('LocalEcho').AsBoolean := FLocalEcho;
  DataSet.FieldByName('FontName').AsString := FFontName;
  DataSet.FieldByName('FontSize').AsInteger := FFontSize;
  DataSet.FieldByName('FontColor').AsInteger := Integer(FFontColor);
  DataSet.FieldByName('CR').AsBoolean := True;
end;

procedure TFMCConexoes.btnNovaConexaoTelnetClick(Sender: TObject);
begin
  kbmMemTable.Append;
  kbmMemTableTipo.AsInteger := 0;
  kbmMemTablePorta.AsInteger := 23;
  FMCEditConexaoTelnet.ShowModal;
end;

procedure TFMCConexoes.kbmMemTablePortaValidate(Sender: TField);
begin
  if (kbmMemTableTipo.AsInteger = 0) and
    ((Sender.Value = NULL) or (Sender.Value < 0) or (Sender.Value > 65535)) then
    raise Exception.Create('Valor deve estar entre 0 e 65535')
  else if (kbmMemTableTipo.AsInteger = 2) and ((Sender.Value = NULL) or
    (Sender.Value < 1) or (Sender.Value > 5)) then
    raise Exception.Create('Valor deve estar entre 1 e 5');
end;

procedure TFMCConexoes.btnGravarClick(Sender: TObject);
var
  i: Integer;
  Str: string;
begin
  if not FAlterado then
    ModalResult := mrOk
  else if FAlterado and (MessageBox(Handle, 'Confirme as alterações..',
    'Confirmação', MB_YESNO + MB_ICONINFORMATION + MB_DEFBUTTON2) = IDYES) then
  begin
    with TIniFile.Create(FPath + 'MultiCom.ini') do
    try
      if FNumConnections > 0 then
      begin
        for i := 0 to FNumConnections - 1 do
        begin
          DeleteKey('Connections', IntToStr(i + 1));
          EraseSection(FNames[i]);
        end;

        i := ReadInteger('Connections', 'Current', 0) - 1;

        if i >= 0 then
          Str := FNames[i]
        else
          Str := '';
      end;
    finally
      UpdateFile;
      Free;
    end;

    with TIniFile.Create(FPath + 'MultiCom.ini') do
    try
      WriteInteger('Connections', 'Connections', kbmMemTable.RecordCount);

      i := 0;

      if kbmMemTable.RecordCount > 0 then
      try
        kbmMemTable.DisableControls;
        kbmMemTable.First;

        while not kbmMemTable.EOF do
        begin
          WriteString('Connections', kbmMemTableCodigo.AsString, kbmMemTableDescricao.AsString);

          WriteInteger(kbmMemTableDescricao.AsString, 'Type', kbmMemTableTipo.AsInteger);
          WriteInteger(kbmMemTableDescricao.AsString, 'Port', kbmMemTablePorta.AsInteger);
          WriteBool(kbmMemTableDescricao.AsString, 'CR', kbmMemTableCR.AsBoolean);

          if kbmMemTableTipo.AsInteger = 0 then
            WriteString(kbmMemTableDescricao.AsString, 'Host',
              kbmMemTableEndereco.AsString)
          else if kbmMemTableTipo.AsInteger = 2 then
          begin
            WriteInteger(kbmMemTableDescricao.AsString, 'BaudRate',
              kbmMemTableBaudRate.AsInteger);
            WriteInteger(kbmMemTableDescricao.AsString, 'DataBits',
              kbmMemTableDataBits.AsInteger);
            WriteInteger(kbmMemTableDescricao.AsString, 'StopBits',
              kbmMemTableStopBits.AsInteger);
            WriteInteger(kbmMemTableDescricao.AsString, 'ParityBits',
              kbmMemTableParityBits.AsInteger);
            WriteInteger(kbmMemTableDescricao.AsString, 'FlowControl',
              kbmMemTableFlowControl.AsInteger);
          end;

          if SameText(Str, kbmMemTableDescricao.AsString) then
            i := kbmMemTableCodigo.AsInteger;

          WriteBool(kbmMemTableDescricao.AsString, 'LocalEcho',
            kbmMemTableLocalEcho.AsBoolean);

          kbmMemTable.Next;
        end;
      finally
        kbmMemTable.EnableControls;
      end;

      WriteInteger('Connections', 'Current', i);
    finally
      UpdateFile;
      Free;
    end;

    ModalResult := mrOk;
  end;
end;

procedure TFMCConexoes.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  kbmMemTable.Close;
end;

procedure TFMCConexoes.kbmMemTableBeforePost(DataSet: TDataSet);
begin
  FAlterado := FAlterado or DataSet.Modified;
end;

procedure TFMCConexoes.btnAlterarClick(Sender: TObject);
begin
  kbmMemTable.Edit;

  if kbmMemTableTipo.AsInteger = 0 then
    FMCEditConexaoTelnet.ShowModal
  else if kbmMemTableTipo.AsInteger = 2 then
    FMCEditConexaoSerial.ShowModal;
end;

procedure TFMCConexoes.btnNovaConexaoSerialClick(Sender: TObject);
begin
  kbmMemTable.Append;
  kbmMemTableTipo.AsInteger := 2;
  kbmMemTablePorta.AsInteger := 1;
  kbmMemTableBaudRate.AsInteger := Integer(br9600);
  kbmMemTableDataBits.AsInteger := Integer(dbEight);
  kbmMemTableStopBits.AsInteger := Integer(sbOneStopBit);
  kbmMemTableParityBits.AsInteger := Integer(prNone);
  kbmMemTableFlowControl.AsInteger := Integer(fcNone);
  FMCEditConexaoSerial.ShowModal;
end;

end.

