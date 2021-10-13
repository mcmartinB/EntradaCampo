(*NOTA*)
(*
 PARA el buen funcionamiento del programa poner en la propiedades de la rejilla
 que no cancele al salir
 *)
program EntradaCampo;

uses
  Forms,
  UFEntradaCampo in 'UFEntradaCampo.pas' {FEntradaCampo},
  UDEntradaCampo in 'UDEntradaCampo.pas' {DEntradaCampo: TDataModule},
  UFFiltro in 'UFFiltro.pas' {FFiltro},
  UDDescripciones in 'UDDescripciones.pas' {DDescripciones: TDataModule},
  UFCalendario in 'UFCalendario.pas' {FCalendario},
  UFRejilla in 'UFRejilla.pas' {FRejilla},
  UFTransportistas in 'UFTransportistas.pas' {FTransportistas},
  UQEntradaCampo in 'UQEntradaCampo.pas' {QEntradaCampo: TQuickRep};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDEntradaCampo, DEntradaCampo);
  if DEntradaCampo.Database.Connected then
  begin
    Application.CreateForm(TFEntradaCampo, FEntradaCampo);
    Application.Run;
  end
  else
  begin
    Application.Terminate;
  end;
end.
