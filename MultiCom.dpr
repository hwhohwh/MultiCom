program MultiCom;

uses
  Forms,
  uMCDefs in 'units\uMCDefs.pas',
  uMCPrincipal in 'units\uMCPrincipal.pas' {FMCPrincipal},
  uMCConexoes in 'units\uMCConexoes.pas' {FMCConexoes},
  uMCEditConexaoTelnet in 'units\uMCEditConexaoTelnet.pas' {FMCEditConexaoTelnet},
  uMCEditConexaoSerial in 'units\uMCEditConexaoSerial.pas' {FMCEditConexaoSerial},
  uFormPadrao in 'units\uFormPadrao.pas' {FormPadrao},
  uMCConfTerminal in 'units\uMCConfTerminal.pas' {FMCConfTerminal};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFMCPrincipal, FMCPrincipal);
  Application.CreateForm(TFMCConexoes, FMCConexoes);
  Application.CreateForm(TFMCEditConexaoTelnet, FMCEditConexaoTelnet);
  Application.CreateForm(TFMCEditConexaoSerial, FMCEditConexaoSerial);
  Application.CreateForm(TFMCConfTerminal, FMCConfTerminal);
  Application.Run;
end.

