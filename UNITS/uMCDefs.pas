unit uMCDefs;

interface

uses
  SysUtils, Graphics, CPort, CPortCtl, CPortTypes;

{
  TPort = string;
  TBaudRate = (brCustom, br110, br300, br600, br1200, br2400, br4800, br9600, br14400,
               br19200, br38400, br56000, br57600, br115200, br128000, br256000);
  TStopBits = (sbOneStopBit, sbOne5StopBits, sbTwoStopBits);
  TDataBits = (dbFive, dbSix, dbSeven, dbEight);
  TParityBits = (prNone, prOdd, prEven, prMark, prSpace);
  TFlowControl = (fcHardware, fcSoftware, fcNone, fcCustom);
}

function ToPort(Value: Integer): string;
function FromPort(Value: string): Integer;

var
  FPath: string;
  FCaret: Integer;
  FLocalEcho: Boolean;
  FSendLF: Boolean;
  FSendWrapLines: Boolean;
  FForce7Bit: Boolean;
  FAppendLF: Boolean;
  FEmulation: Integer;
  FArrowKeys: Integer;

  FFontName: TFontName;
  FFontSize: Integer;
  FFontColor: TColor;
  FFontStyleBold: Boolean;
  FFontStyleItalic: Boolean;
  FFontStyleUnderline: Boolean;
  FFontStyleStrikeOut: Boolean;

  FComPort: Integer;
  FComBaudRate: TBaudRate;
  FComDataBits: TDataBits;
  FComStopBits: TStopBits;
  FComParity: TParityBits;
  FComFlowControl: TFlowControl;
  F1: TextFile;
  FNumConnections: Integer;
  FNames: array of string;
  FTypes: array of Integer;
  FHosts: array of string;
  FPorts: array of Integer;
  FCR_LF: array of Boolean;
  FComsPort: array of Integer;
  FComsBaudRate: array of TBaudRate;
  FComsDataBits: array of TDataBits;
  FComsStopBits: array of TStopBits;
  FComsParityBits: array of TParityBits;
  FComsFlowControl: array of TFlowControl;
  FComsLocalEcho: array of Boolean;
  FFontsName: array of TFontName;
  FFontsSize: array of Integer;
  FFontsColor: array of TColor;
  FFontsStyleBold: array of Boolean;
  FFontsStyleItalic: array of Boolean;
  FFontsStyleUnderline: array of Boolean;
  FFontsStyleStrikeOut: array of Boolean;

implementation

function ToPort(Value: Integer): string;
begin
  Result := Format('COM%d', [Value]);
end;

function FromPort(Value: string): Integer;
begin
  if not SameText(Copy(Value, 1, 3), 'COM') then
    Result := 0
  else
    Result := StrToIntDef(Copy(Value, 4, Length(Value)), 0);
end;

end.

