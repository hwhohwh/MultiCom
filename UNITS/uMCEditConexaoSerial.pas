unit uMCEditConexaoSerial;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls, CPort, CPortCtl, DB,
  CPortTypes, uFormPadrao;

type
  TFMCEditConexaoSerial = class(TFormPadrao)
    btnCancelar: TSpeedButton;
    btnGravar: TSpeedButton;
    Label2: TLabel;
    Descricao: TDBEdit;
    ConfComPort: TComPort;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    cmbBaudRate: TComComboBox;
    cmbDataBits: TComComboBox;
    cmbStopBits: TComComboBox;
    cmbParity: TComComboBox;
    cmbFlowControl: TComComboBox;
    cmbPorta: TComComboBox;
    chkLocalEcho: TCheckBox;
    chkCRLF: TDBCheckBox;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnConfigSerialClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure chkCRLFClick(Sender: TObject);
  private
    procedure Grava(DataSet: TDataSet; Campo: string; Valor: Integer); overload;
    procedure Grava(DataSet: TDataSet; Campo: string; Valor: Boolean); overload;
  public
  end;

var
  FMCEditConexaoSerial: TFMCEditConexaoSerial;

implementation

uses
  uMCConexoes, uMCDefs;

{$R *.dfm}

procedure TFMCEditConexaoSerial.btnCancelarClick(Sender: TObject);
begin
  if MessageBox(Handle, 'Confirme o cancelamento..', 'Confirmação', MB_YESNO +
    MB_ICONINFORMATION + MB_DEFBUTTON2) = IDYES then
  begin
    FMCConexoes.kbmMemTable.Cancel;
    Close;
  end;
end;

procedure TFMCEditConexaoSerial.btnGravarClick(Sender: TObject);
var
  Str: string;
begin
  if Trim(FMCConexoes.kbmMemTableDescricao.AsString) = EmptyStr then
  begin
    Descricao.SetFocus;
    raise Exception.Create('Informar o nome da conexão');
  end
  else
  begin
    if FMCConexoes.kbmMemTable.State = dsInsert then
      Str := 'inclus'
    else
      Str := 'alteraç';

    if MessageBox(Handle, PChar('Confirme a ' + Str + 'ão..'), 'Confirmação',
      MB_YESNO + MB_ICONINFORMATION + MB_DEFBUTTON2) = IDYES then
    begin
      ConfComPort.BeginUpdate;
      cmbPorta.ApplySettings;
      cmbBaudRate.ApplySettings;
      cmbDataBits.ApplySettings;
      cmbStopBits.ApplySettings;
      cmbParity.ApplySettings;
      cmbFlowControl.ApplySettings;
      ConfComPort.EndUpdate;

      Grava(FMCConexoes.kbmMemTable, 'Porta', FromPort(ConfComPort.Port));
      Grava(FMCConexoes.kbmMemTable, 'BaudRate', Integer(ConfComPort.BaudRate));
      Grava(FMCConexoes.kbmMemTable, 'DataBits', Integer(ConfComPort.DataBits));
      Grava(FMCConexoes.kbmMemTable, 'StopBits', Integer(ConfComPort.StopBits));
      Grava(FMCConexoes.kbmMemTable, 'ParityBits', Integer(ConfComPort.Parity.Bits));
      Grava(FMCConexoes.kbmMemTable, 'FlowControl', Integer(ConfComPort.FlowControl.FlowControl));
      Grava(FMCConexoes.kbmMemTable, 'LocalEcho', chkLocalEcho.Checked);
      FMCConexoes.kbmMemTable.Post;
      Close;
    end;
  end;
end;

procedure TFMCEditConexaoSerial.btnConfigSerialClick(Sender: TObject);
begin
  ConfComPort.ShowSetupDialog;
end;

procedure TFMCEditConexaoSerial.FormShow(Sender: TObject);
begin
  ConfComPort.BeginUpdate;
  ConfComPort.Port := ToPort(FMCConexoes.kbmMemTablePorta.AsInteger);
  ConfComPort.BaudRate := TBaudRate(FMCConexoes.kbmMemTableBaudRate.AsInteger);
  ConfComPort.DataBits := TDataBits(FMCConexoes.kbmMemTableDataBits.AsInteger);
  ConfComPort.StopBits := TStopBits(FMCConexoes.kbmMemTableStopBits.AsInteger);
  ConfComPort.Parity.Bits :=    TParityBits(FMCConexoes.kbmMemTableParityBits.AsInteger);
  ConfComPort.FlowControl.FlowControl :=    TFlowControl(FMCConexoes.kbmMemTableFlowControl.AsInteger);
  ConfComPort.EndUpdate;

  cmbPorta.UpdateSettings;
  cmbBaudRate.UpdateSettings;
  cmbDataBits.UpdateSettings;
  cmbStopBits.UpdateSettings;
  cmbParity.UpdateSettings;
  cmbFlowControl.UpdateSettings;

  chkLocalEcho.Checked := FMCConexoes.kbmMemTableLocalEcho.AsBoolean;
end;

procedure TFMCEditConexaoSerial.Grava(DataSet: TDataSet; Campo: string; Valor:
  Integer);
begin
  if not DataSet.Active then
    DataSet.Open;

  if DataSet.FieldByName(Campo).AsInteger <> Valor then
  begin
    if not (DataSet.State in dsEditModes) then
      DataSet.Edit;

    DataSet.FieldByName(Campo).AsInteger := Valor;
  end;
end;

procedure TFMCEditConexaoSerial.Grava(DataSet: TDataSet; Campo: string;
  Valor: Boolean);
begin
  if not DataSet.Active then
    DataSet.Open;

  if DataSet.FieldByName(Campo).AsBoolean <> Valor then
  begin
    if not (DataSet.State in dsEditModes) then
      DataSet.Edit;

    DataSet.FieldByName(Campo).AsBoolean := Valor;
  end;
end;

procedure TFMCEditConexaoSerial.chkCRLFClick(Sender: TObject);
begin
  if chkCRLF.Checked then
    chkCRLF.Caption := 'CR '
  else
    chkCRLF.Caption := 'LF ';
end;

end.

