unit UDEntradaCampo;

interface

uses
  SysUtils, Classes, DB, DBTables, kbmMemTable;

type
  TDEntradaCampo = class(TDataModule)
    QListado: TQuery;
    Database: TDatabase;
    QBorrarDetalle: TQuery;
    QBorrarPalets: TQuery;
    QGetEntrada: TQuery;
    QPutEntrada: TQuery;
    QTemp: TQuery;
    QAux: TQuery;
    QTieneEscandallos: TQuery;
    QCambiarTransportista: TQuery;
    QPesos: TQuery;
    QTaraCamion: TQuery;
    QResumenDetalle: TQuery;
    TResumenDetalle: TkbmMemTable;
    TResumenDetallecosechero: TIntegerField;
    TResumenDetalleplantacion: TIntegerField;
    TResumenDetalleano_sem_planta: TStringField;
    TResumenDetalletotal_cajas: TIntegerField;
    TResumenDetalletotal_kgs: TFloatField;
    QBorrarResumen: TQuery;
    QActualizarCabecera: TQuery;
    frf_entradas2_l: TQuery;
    frf_entradas2_lempresa_e2l: TStringField;
    frf_entradas2_lcentro_e2l: TStringField;
    frf_entradas2_lnumero_entrada_e2l: TIntegerField;
    frf_entradas2_lfecha_e2l: TDateField;
    frf_entradas2_lcosechero_e2l: TSmallintField;
    frf_entradas2_lplantacion_e2l: TSmallintField;
    frf_entradas2_lano_sem_planta_e2l: TStringField;
    frf_entradas2_ltotal_cajas_e2l: TIntegerField;
    frf_entradas2_ltotal_kgs_e2l: TFloatField;
    frf_entradas2_lproducto_e2l: TStringField;
    frf_entradas2_lsectores_e2l: TStringField;
    QPalets: TQuery;
    QSectorEntrada: TQuery;
    qryResumenPalets: TQuery;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function GetNumeroEntrada( const AEmpresa, ACentro: string; const AActualizar: boolean ): integer;
  end;

var
  DEntradaCampo: TDEntradaCampo;
  sgEmpresa, sgCentro: string;

implementation

{$R *.dfm}

uses
  IniFiles;

procedure TDEntradaCampo.DataModuleCreate(Sender: TObject);
var
  IniFile: TIniFile;
  sAux: string;
begin
  //Leer fichero de configuracion
  sAux:= GetCurrentDir + '\EntradaCampo.ini';
  if FileExists( sAux ) then
  begin
    //Parametros de la base de datos
    Database.Params.Clear;
    IniFile:= TIniFile.Create( sAux );
    sAux:= IniFile.ReadString( 'BDDATA', 'ALIAS', 'comer.almacen' );
    Database.AliasName:= sAux;
    sAux:= IniFile.ReadString( 'BDDATA', 'USERNAME', 'cica' );
    Database.Params.Values['USER NAME']:= sAux;
    sAux:= IniFile.ReadString( 'BDDATA', 'PASSWORD', 'cica1' );
    Database.Params.Values['PASSWORD']:= sAux;

    //Valores globales
    sgEmpresa:= IniFile.ReadString( 'PORDEFECTO', 'EMPRESA', '050' );
    sgCentro:= IniFile.ReadString( 'PORDEFECTO', 'CENTRO', '1' );

    IniFile.Free;
  end;
  Database.Connected:= True;

  if Database.Connected then
  begin
    with QBorrarDetalle do
    begin
      SQL.Clear;
      SQL.Add('delete from frf_entradas2_l ');
      SQL.Add('where empresa_e2l = :empresa ');
      SQL.Add('  and centro_e2l = :centro ');
      SQL.Add('  and numero_entrada_e2l = :entrada ');
      SQL.Add('  and fecha_e2l = :fecha ');
      Prepare;
    end;
    with QBorrarPalets do
    begin
      SQL.Clear;
      SQL.Add('delete from frf_entradas1_l ');
      SQL.Add('where empresa_e1l = :empresa ');
      SQL.Add('  and centro_e1l = :centro ');
      SQL.Add('  and numero_entrada_e1l = :entrada ');
      SQL.Add('  and fecha_e1l = :fecha ');
      Prepare;
    end;
    with QGetEntrada do
    begin
      SQL.Clear;
      SQL.Add('select cont_entradas_c contador ');
      SQL.Add('from frf_centros ');
      SQL.Add('where empresa_c = :empresa ');
      SQL.Add('and centro_c = :centro ');
      Prepare;
    end;
    with QPutEntrada do
    begin
      SQL.Clear;
      SQL.Add('update frf_centros ');
      SQL.Add('set cont_entradas_c = :contador ');
      SQL.Add('where empresa_c = :empresa ');
      SQL.Add('and centro_c = :centro ');
      Prepare;
    end;
    with QTieneEscandallos do
    begin
      SQL.Clear;
      SQL.Add('select * ');
      SQL.Add('from frf_escandallo ');
      SQL.Add('where empresa_e = :empresa ');
      SQL.Add('and centro_e = :centro ');
      SQL.Add('and numero_entrada_e = :entrada ');
      SQL.Add('and fecha_e = :fecha ');
      Prepare;
    end;
    with QCambiarTransportista do
    begin
      SQL.Clear;
      SQL.Add('update frf_entradas1_l ');
      SQL.Add('set transportista_e1l = :transportista ');
      SQL.Add('where empresa_e1l = :empresa ');
      SQL.Add('and centro_e1l = :centro ');
      SQL.Add('and numero_entrada_e1l = :entrada ');
      SQL.Add('and fecha_e1l = :fecha ');
      Prepare;
    end;
    with QPesos do
    begin
      SQL.Clear;
      SQL.Add('select peso_palet_p peso_palet, peso_caja_p peso_caja, ');
      SQL.Add('       cajas_palet_p cajas, nvl(descripcion_p,''FALTA DESCRIPCION'') descripcion ');
      SQL.Add('from  frf_pesos ');
      SQL.Add('where empresa_p = :empresa ');
      SQL.Add('and centro_p = :centro ');
      SQL.Add('and producto_p = :producto ');
      SQL.Add('and formato_p = :formato ');
      Prepare;
    end;
    with QTaraCamion do
    begin
      SQL.Clear;
      SQL.Add('select tara_c tara');
      SQL.Add('from  frf_camiones ');
      SQL.Add('where camion_c = :camion ');
      Prepare;
    end;
    with QResumenDetalle do
    begin
      SQL.Clear;
      SQL.Add('select cosechero_e1l, plantacion_e1l, ano_sem_planta_e1l, ');
      SQL.Add('       count(distinct codigo_palet_e1l) total_palets_e1l, ');
      SQL.Add('       sum(total_cajas_e1l) total_cajas_e1l, ');
      SQL.Add('       sum(bruto_e1l) total_bruto_e1l, ');
      SQL.Add('       sum(kilos_e1l) total_kilos_e1l ');
      SQL.Add('from frf_entradas1_l ');
      SQL.Add('where empresa_e1l = :empresa ');
      SQL.Add('and centro_e1l = :centro ');
      SQL.Add('and fecha_e1l = :fecha ');
      SQL.Add('and numero_entrada_e1l = :entrada ');
      SQL.Add('group by 1,2,3 ');
      Prepare;
    end;
    with qryResumenPalets do
    begin
      SQL.Clear;
      SQL.Add('select cosechero_e1l, plantacion_e1l, ano_sem_planta_e1l, formato_e1l, ');
      SQL.Add('       count(distinct codigo_palet_e1l) total_palets_e1l, ');
      SQL.Add('       sum(total_cajas_e1l) total_cajas_e1l ');
      SQL.Add('from frf_entradas1_l ');
      SQL.Add('where empresa_e1l = :empresa ');
      SQL.Add('and centro_e1l = :centro ');
      SQL.Add('and fecha_e1l = :fecha ');
      SQL.Add('and numero_entrada_e1l = :entrada ');
      SQL.Add('and cosechero_e1l = :cosechero ');
      SQL.Add('and plantacion_e1l = :plantacion ');
      SQL.Add('and ano_sem_planta_e1l = :ano_sem_planta ');
      SQL.Add('group by 1,2,3, 4 ');
      Prepare;
    end;
    with QPalets do
    begin
      SQL.Clear;
      SQL.Add('select formato_e1l, count(distinct codigo_palet_e1l) total_palets_e1l, ');
      SQL.Add('       sum(total_cajas_e1l) total_cajas_e1l, sum(bruto_e1l) total_bruto_e1l, ');
      SQL.Add('       sum(kilos_e1l) total_kilos_e1l ');
      SQL.Add('from frf_entradas1_l ');
      SQL.Add('where empresa_e1l = :empresa ');
      SQL.Add('and centro_e1l = :centro ');
      SQL.Add('and fecha_e1l = :fecha ');
      SQL.Add('and numero_entrada_e1l = :entrada ');
      SQL.Add('group by 1 ');
      Prepare;
    end;
    with QBorrarResumen do
    begin
      SQL.Clear;
      SQL.Add('delete ');
      SQL.Add('from frf_entradas2_l ');
      SQL.Add('where empresa_e2l = :empresa ');
      SQL.Add('and centro_e2l = :centro ');
      SQL.Add('and fecha_e2l = :fecha ');
      SQL.Add('and numero_entrada_e2l = :entrada ');
      Prepare;
    end;
    with QSectorEntrada do
    begin
      SQL.Clear;
      SQL.Add('select sectores_e2l');
      SQL.Add('from frf_entradas2_l ');
      SQL.Add('where empresa_e2l = :empresa ');
      SQL.Add('and centro_e2l = :centro ');
      SQL.Add('and fecha_e2l = :fecha ');
      SQL.Add('and numero_entrada_e2l = :entrada ');
      Prepare;
    end;
    with QActualizarCabecera do
    begin
      SQL.Clear;
      SQL.Add('update frf_entradas_c ');
      SQL.Add('set total_cajas_ec = :total_cajas, ');
      SQL.Add('    total_palets_ec = :total_palets, ');
      SQL.Add('    peso_bruto_ec = :peso_bruto, ');
      SQL.Add('    peso_neto_ec = :peso_neto ');
      SQL.Add('where empresa_ec = :empresa ');
      SQL.Add('and centro_ec = :centro ');
      SQL.Add('and fecha_ec = :fecha ');
      SQL.Add('and numero_entrada_ec = :entrada ');
      Prepare;
    end;
    with frf_entradas2_l do
    begin
      SQL.Clear;
      SQL.Add('select * ');
      SQL.Add('from frf_entradas2_l ');
      Open;
    end;
  end;
end;

procedure TDEntradaCampo.DataModuleDestroy(Sender: TObject);
begin
  if Database.Connected then
  begin
    if QBorrarDetalle.Prepared then
    begin
      QBorrarDetalle.Unprepare;
    end;
    if QBorrarPalets.Prepared then
    begin
      QBorrarPalets.Unprepare;
    end;
    if QGetEntrada.Prepared then
    begin
      QGetEntrada.Unprepare;
    end;
    if QPutEntrada.Prepared then
    begin
      QPutEntrada.Unprepare;
    end;
    if QTieneEscandallos.Prepared then
    begin
      QTieneEscandallos.Unprepare;
    end;
    if QCambiarTransportista.Prepared then
    begin
      QCambiarTransportista.Unprepare;
    end;
    if QPesos.Prepared then
    begin
      QPesos.Unprepare;
    end;
    if QTaraCamion.Prepared then
    begin
      QTaraCamion.Unprepare;
    end;
    if QResumenDetalle.Prepared then
    begin
      QResumenDetalle.Unprepare;
    end;
    if QPalets.Prepared then
    begin
      QPalets.Unprepare;
    end;
    if QBorrarResumen.Prepared then
    begin
      QBorrarResumen.Unprepare;
    end;
    if QSectorEntrada.Prepared then
    begin
      QSectorEntrada.Unprepare;
    end;
    if QActualizarCabecera.Prepared then
    begin
      QActualizarCabecera.Unprepare;
    end;
    if frf_entradas2_l.Active then
    begin
      frf_entradas2_l.Close;
    end;

    Database.CloseDataSets;
    Database.Connected:= False;
  end;
end;

function TDEntradaCampo.GetNumeroEntrada( const AEmpresa, ACentro: string; const AActualizar: boolean ): integer;
var
  bTransaccion, bAux: boolean;
begin
  bTransaccion:= not DEntradaCampo.Database.InTransaction;
  if bTransaccion then
    DEntradaCampo.Database.StartTransaction;

  try
    with QGetEntrada do
    begin
      ParamByName('empresa').AsString:= AEmpresa;
      ParamByName('centro').AsString:= ACentro;
      Open;
      bAux:= not IsEmpty;
      if bAux then
        result:= FieldByName('contador').AsInteger
      else
        result:=  -1;
      Close;
    end;

    if AActualizar and bAux then
    begin
      with QPutEntrada do
      begin
        ParamByName('empresa').AsString:= AEmpresa;
        ParamByName('centro').AsString:= ACentro;
        ParamByName('contador').AsInteger:= result + 1;
        ExecSQL;
      end;
    end;

    if bTransaccion then
      DEntradaCampo.Database.Commit;
  except
    if bTransaccion then
      DEntradaCampo.Database.Rollback;
    raise;
  end;
end;

end.
