unit uMCConexaoSerial;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls, CPort;

type
  TFMultiCom5 = class(TForm)
    btnCancelar: TSpeedButton;
    btnGravar: TSpeedButton;
    Label2: TLabel;
    Descricao: TDBEdit;
    ConfComPort: TComPort;
    btnConfigSerial: TBitBtn;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnConfigSerialClick(Sender: TObject);
  private
    PortaAnt: string;
  public
  end;

var
  FMultiCom5: TFMultiCom5;

implementation

uses
  DB, uMCConexoes;

{$R *.dfm}

procedure TFMultiCom5.btnCancelarClick(Sender: TObject);
begin
  if MessageBox(Handle, 'Confirme o cancelamento..', 'Confirmação', MB_YESNO +
    MB_ICONINFORMATION + MB_DEFBUTTON2) = IDYES then
  begin
    FMCConexoes.kbmMemTable.Cancel;
    Close;
  end;
end;

procedure TFMultiCom5.btnGravarClick(Sender: TObject);
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
      MB_YESNO +
      MB_ICONINFORMATION + MB_DEFBUTTON2) = IDYES then
    begin
      FMCConexoes.kbmMemTable.Post;
      Close;
    end;
  end;
end;

procedure TFMultiCom5.btnConfigSerialClick(Sender: TObject);
begin
  ConfComPort.ShowSetupDialog;
end;

end.

