unit uMCConfTerminal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormPadrao, CPortCtl;

type
  TFMCConfTerminal = class(TFormPadrao)
    ComTerminal: TComTerminal;
  private
  public
    procedure ConfigTerminal;
    procedure ConfigFont;
    procedure ConfigComm;
  end;

var
  FMCConfTerminal: TFMCConfTerminal;

implementation

uses
  uMCDefs, IniFiles;

{$R *.dfm}

procedure TFMCConfTerminal.ConfigComm;
begin
end;

procedure TFMCConfTerminal.ConfigFont;
begin
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

  ComTerminal.SelectFont;

  FFontName := ComTerminal.Font.Name;
  FFontSize := ComTerminal.Font.Size;
  FFontColor := ComTerminal.Font.Color;
  FFontStyleBold := fsBold in ComTerminal.Font.Style;
  FFontStyleItalic := fsItalic in ComTerminal.Font.Style;
  FFontStyleUnderline := fsUnderline in ComTerminal.Font.Style;
  FFontStyleStrikeOut := fsStrikeOut in ComTerminal.Font.Style;

  with TIniFile.Create(FPath + 'MultiCom.ini') do
  try
    WriteString('Terminal', 'FontName', FFontName);
    WriteInteger('Terminal', 'FontSize', FFontSize);
    WriteInteger('Terminal', 'FontColor', Integer(FFontColor));
    WriteBool('Terminal', 'FontStyleBold', FFontStyleBold);
    WriteBool('Terminal', 'FontStyleItalic', FFontStyleItalic);
    WriteBool('Terminal', 'FontStyleUnderline', FFontStyleUnderline);
    WriteBool('Terminal', 'FontStyleStrikeOut', FFontStyleStrikeOut);
  finally
    UpdateFile;
    Free;
  end;
end;

procedure TFMCConfTerminal.ConfigTerminal;
begin
  ComTerminal.LocalEcho := FLocalEcho;
  ComTerminal.SendLF := FSendLF;
  ComTerminal.WrapLines := FSendWrapLines;
  ComTerminal.Force7Bit := FForce7Bit;
  ComTerminal.AppendLF := FAppendLF;
  ComTerminal.Caret := TTermCaret(FCaret);
  ComTerminal.Emulation := TTermEmulation(FEmulation);
  ComTerminal.ArrowKeys := TArrowKeys(FArrowKeys);

  ComTerminal.ShowSetupDialog;

  FLocalEcho := ComTerminal.LocalEcho;
  FSendLF := ComTerminal.SendLF;
  FSendWrapLines := ComTerminal.WrapLines;
  FForce7Bit := ComTerminal.Force7Bit;
  FAppendLF := ComTerminal.AppendLF;
  FCaret := Integer(ComTerminal.Caret);
  FEmulation := Integer(ComTerminal.Emulation);
  FArrowKeys := Integer(ComTerminal.ArrowKeys);

  with TIniFile.Create(FPath + 'MultiCom.ini') do
  try
    WriteInteger('Terminal', 'Rows', ComTerminal.Rows);
    WriteInteger('Terminal', 'Columns', ComTerminal.Columns);
    WriteBool('Terminal', 'LocalEcho', ComTerminal.LocalEcho);
    WriteBool('Terminal', 'SendLF', ComTerminal.SendLF);
    WriteBool('Terminal', 'WrapLines', ComTerminal.WrapLines);
    WriteBool('Terminal', 'Force7Bit', ComTerminal.Force7Bit);
    WriteBool('Terminal', 'AppendLF', ComTerminal.AppendLF);
    WriteInteger('Terminal', 'Caret', Integer(ComTerminal.Caret));
    WriteInteger('Terminal', 'Emulation', Integer(ComTerminal.Emulation));
    WriteInteger('Terminal', 'ArrowKeys', Integer(ComTerminal.ArrowKeys));
    UpdateFile;
  finally
    Free;
  end;
end;

end.

