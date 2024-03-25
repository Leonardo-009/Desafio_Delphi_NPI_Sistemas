program DesafioNpi;

uses
  Vcl.Forms,
  UPrincipal in 'UPrincipal.pas' {FPrincipal},
  UCadSocio in 'UCadSocio.pas' {FCadSocio},
  UDmNpi in 'UDmNpi.pas' {DMNpi: TDataModule},
  URelatorio in 'URelatorio.pas' {FRelatorio};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDMNpi, DMNpi);
  Application.CreateForm(TFPrincipal, FPrincipal);
  Application.CreateForm(TFCadSocio, FCadSocio);
  Application.CreateForm(TFRelatorio, FRelatorio);
  Application.Run;
end.
