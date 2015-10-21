unit uMCEditConexaoTelnet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls, DB, uFormPadrao;

type
  TFMCEditConexaoTelnet = class(TFormPadrao)
    btnCancelar: TSpeedButton;
    btnGravar: TSpeedButton;
    Label2: TLabel;
    Descricao: TDBEdit;
    lblEndereco: TLabel;
    Endereco: TDBEdit;
    lblPorta: TLabel;
    edtPorta: TDBEdit;
    chkLocalEcho: TDBCheckBox;
    chkCRLF: TDBCheckBox;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure edtPortaEnter(Sender: TObject);
    procedure edtPortaExit(Sender: TObject);
    procedure edtPortaKeyPress(Sender: TObject; var Key: Char);
    procedure chkCRLFClick(Sender: TObject);
  private
    PortaAnt: string;
  public
  end;

var
  FMCEditConexaoTelnet: TFMCEditConexaoTelnet;

implementation

uses
  uMCConexoes;

{$R *.dfm}

procedure TFMCEditConexaoTelnet.btnCancelarClick(Sender: TObject);
begin
  if MessageBox(Handle, 'Confirme o cancelamento..', 'Confirmação', MB_YESNO +
    MB_ICONINFORMATION + MB_DEFBUTTON2) = IDYES then
  begin
    FMCConexoes.kbmMemTable.Cancel;
    Close;
  end;
end;

procedure TFMCEditConexaoTelnet.btnGravarClick(Sender: TObject);
var
  Str: string;
begin
  if Trim(FMCConexoes.kbmMemTableDescricao.AsString) = EmptyStr then
  begin
    Descricao.SetFocus;
    raise Exception.Create('Informar o nome da conexão');
  end
  else if Trim(FMCConexoes.kbmMemTableEndereco.AsString) = EmptyStr then
  begin
    Endereco.SetFocus;
    raise Exception.Create('Informar o endereco');
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

procedure TFMCEditConexaoTelnet.edtPortaEnter(Sender: TObject);
begin
  PortaAnt := edtPorta.Text;
end;

procedure TFMCEditConexaoTelnet.edtPortaExit(Sender: TObject);
var
  Porta: Integer;
begin
  if PortaAnt <> edtPorta.Text then
  begin
    Porta := StrToIntDef(edtPorta.Text, -1);
    if (Porta < 0) or (Porta > 65535) then
    begin
      ShowMessage('Porta inválida');
      edtPorta.Text := PortaAnt;
      edtPorta.SetFocus;
    end;
  end;
end;

procedure TFMCEditConexaoTelnet.edtPortaKeyPress(Sender: TObject; var Key:
  Char);
begin
  if (Key > #31) and (Key <> #127) and not (Key in ['0'..'9']) then
    Key := #0;
end;

procedure TFMCEditConexaoTelnet.chkCRLFClick(Sender: TObject);
begin
  if chkCRLF.Checked then
    chkCRLF.Caption := 'CR '
  else
    chkCRLF.Caption := 'LF ';
end;

end.

