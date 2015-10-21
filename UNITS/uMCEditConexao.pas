unit uMCEditConexao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls, DB;

type
  TFMCEditConexao = class(TForm)
    btnCancelar: TSpeedButton;
    btnGravar: TSpeedButton;
    Tipo: TRadioGroup;
    Label2: TLabel;
    Descricao: TDBEdit;
    lblEndereco: TLabel;
    Endereco: TDBEdit;
    lblPorta: TLabel;
    edtPorta: TDBEdit;
    PortaCom: TRadioGroup;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure edtPortaEnter(Sender: TObject);
    procedure edtPortaExit(Sender: TObject);
    procedure edtPortaKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure TipoClick(Sender: TObject);
    procedure PortaComClick(Sender: TObject);
  private
    PortaAnt: string;
    procedure Atualiza;
  public
  end;

var
  FMCEditConexao: TFMCEditConexao;

implementation

uses uMCConexoes;

{$R *.dfm}

procedure TFMCEditConexao.btnCancelarClick(Sender: TObject);
begin
  if MessageBox(Handle, 'Confirme o cancelamento..', 'Confirmação', MB_YESNO +
    MB_ICONINFORMATION + MB_DEFBUTTON2) = IDYES then
  begin
    FMCConexoes.kbmMemTable.Cancel;
    Close;
  end;
end;

procedure TFMCEditConexao.btnGravarClick(Sender: TObject);
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
    if FMCConexoes.kbmMemTable.State = dsInsert then Str := 'inclus'
    else Str := 'alteraç';
    if MessageBox(Handle, PChar('Confirme a ' + Str + 'ão..'), 'Confirmação', MB_YESNO +
      MB_ICONINFORMATION + MB_DEFBUTTON2) = IDYES then
    begin
      FMCConexoes.kbmMemTable.Post;
      Close;
    end;
  end;
end;

procedure TFMCEditConexao.edtPortaEnter(Sender: TObject);
begin
  PortaAnt := edtPorta.Text;
end;

procedure TFMCEditConexao.edtPortaExit(Sender: TObject);
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

procedure TFMCEditConexao.edtPortaKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key > #31) and (Key <> #127) and not (Key in ['0'..'9']) then
    Key := #0;
end;

procedure TFMCEditConexao.FormCreate(Sender: TObject);
begin
  PortaCom.Left := Endereco.Left;
end;

procedure TFMCEditConexao.FormShow(Sender: TObject);
var
  i: Integer;
begin
  Tipo.Enabled := FMCConexoes.kbmMemTable.State = dsInsert;

  if FMCConexoes.kbmMemTableTipo.Value = 0 then
    Tipo.ItemIndex := 0
  else if FMCConexoes.kbmMemTableTipo.Value = 2 then
  begin
    if FMCConexoes.kbmMemTableEndereco.Value <> NULL then
    begin
      i := StrToIntDef(FMCConexoes.kbmMemTableEndereco.AsString, 0) - 1;
      if (i > -1) and (i < 6) then
        PortaCom.ItemIndex := i;
    end;
    Tipo.ItemIndex := 1;
  end;
  TipoClick(nil);
end;

procedure TFMCEditConexao.TipoClick(Sender: TObject);
begin
  if (Tipo.ItemIndex = 0) and (FMCConexoes.kbmMemTableTipo.Value <> 0) then
    FMCConexoes.kbmMemTableTipo.Value := 0
  else if (Tipo.ItemIndex = 1) and (FMCConexoes.kbmMemTableTipo.Value <> 2) then
    FMCConexoes.kbmMemTableTipo.Value := 2;

  Atualiza;
end;

procedure TFMCEditConexao.PortaComClick(Sender: TObject);
begin
  if (Tipo.ItemIndex = 1) and (FMCConexoes.kbmMemTableEndereco.AsString <>
    IntToStr(PortaCom.ItemIndex + 1)) then
    FMCConexoes.kbmMemTableEndereco.AsString := IntToStr(PortaCom.ItemIndex + 1);
end;

procedure TFMCEditConexao.Atualiza;
begin
  lblPorta.Visible := Tipo.ItemIndex = 0;
  edtPorta.Visible := lblPorta.Visible;
  lblEndereco.Visible := lblPorta.Visible;

  if lblPorta.Visible then
  begin
    Endereco.DataField := 'Endereco';
    PortaCom.Visible := False;
    Endereco.Visible := True;
  end
  else
  begin
    Endereco.DataField := '';
    PortaComClick(nil);
    Endereco.Visible := False;
    PortaCom.Visible := True;
  end;
end;

end.
