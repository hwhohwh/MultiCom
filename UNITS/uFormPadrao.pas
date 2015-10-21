unit uFormPadrao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids;

type
  TFormPadrao = class(TForm)
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
  public
  end;

var
  FormPadrao: TFormPadrao;

implementation

{$R *.dfm}

procedure TFormPadrao.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  // Se estiver em algum grid fazer SOMENTE operações default
  if (ActiveControl is TCustomGrid) then
  begin
    inherited;
    Exit;
  end;

  if (Key in [9, 13]) and not (ssCtrl in Shift) and (ActiveControl <> nil) then
  begin
    Key := 0;
    SelectNext(ActiveControl, not (ssShift in Shift), True);
    Exit;
  end;

  if Key <> 0 then
    inherited;
end;

end.

