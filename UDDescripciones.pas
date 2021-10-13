unit UDDescripciones;

interface

uses
  Forms, SysUtils, Classes, DB, DBTables;

type
  TDDescripciones = class(TDataModule)
    QDescripciones: TQuery;
    QAux: TQuery;
  private
    { Private declarations }
    function Descripcion(sqlCad: string): string;
    function ProductoBase(  const AEmpresa, AProducto: string ): string;
    function TieneSuministros( const AEmpresa, ACliente: string ): Boolean;

  public
    { Public declarations }
    function desEmpresa(const empresa: string): string;
    function desCentro(const empresa, centro: string): string;
    function desCliente(const empresa, cliente: string): string;
    function desProducto(const empresa, producto: string): string;
    function desProductoAlta(const producto: string): string;
    function desTransporte(const empresa, transporte: string): string;
    function desPais(const pais: string): string;
    function desMoneda(const moneda: string): string;
    function desProvincia(const codPostal: string): string;
    function desColor(const empresa, producto, color: string): string;
    function desMarca(const marca: string): string;
    function desTipoPalet(const palet: string): string;
    function desEnvase(const empresa, envase: string): string;
    function desEnvaseComercial(const AEan13: string): string;
    function desCategoria(const empresa, producto, catego: string): string;
    function desSuministro(const empresa, cliente, dirSum: string): string;
    function desCosechero(const empresa, cosechero: string): string;
    function desFormato(const empresa, centro, producto, formato: string): string;
    function desVariedad(const empresa, producto, codigo: string): string;

    function EsProductoAlta( const producto: string): boolean;

    function CalcularAnoSemana(empresa, producto, cosechero, plantacion, fecha: string): string;
    function desPlantacion(empresa, producto, cosechero, plantacion, anyoSemana: string): string;
    function desPlantacionEx(empresa, producto, cosechero, plantacion, fecha: string): string;

    function desEnvaseCliente(const empresa, producto, envase, cliente: string;
      const esEspanyol: integer = -1): string;
    function desEnvaseClienteEx(const empresa, producto, envase, cliente: string;
      const esEspanyol: integer = -1): string;

  end;

  procedure InicializaModulo( const ABaseDatos: string );
  procedure FinalizaModulo;


var
  DDescripciones: TDDescripciones;

implementation

uses bSQLUtils;

{$R *.dfm}

procedure InicializaModulo( const ABaseDatos: string );
begin
  DDescripciones:= TDDescripciones.Create( Application );
  DDescripciones.QDescripciones.DatabaseName:= ABaseDatos;
  DDescripciones.QAux.DatabaseName:= ABaseDatos;
end;

procedure FinalizaModulo;
begin
  FreeAndNil( DDescripciones );
end;

function TDDescripciones.Descripcion(sqlCad: string): string;
begin
  with QDescripciones do
  begin
    SQL.Text := sqlCad;
    try
      try
        Open;
        if IsEmpty then Descripcion := ''
        else Descripcion := Fields[0].AsString;
      except
        Descripcion := '';
      end;
    finally
      Cancel;
      Close;
    end;
  end;
end;

function TDDescripciones.ProductoBase(  const AEmpresa, AProducto: string ): string;
begin
  ProductoBase := '';
  if (Trim(AEmpresa) = '') or (Trim(AProducto) = '') then Exit;
  Result := Descripcion(' select producto_base_p from frf_productos ' +
    ' where producto_p ' + SQLEqualS(AProducto));
end;

function TDDescripciones.TieneSuministros( const AEmpresa, ACliente: string ): Boolean;
begin
  with QAux do
  begin
    SQL.Clear;
    SQL.Add(' select count(*) ');
    SQL.Add(' from frf_dir_sum ');
    SQL.Add(' where empresa_ds = :empresa ');
    SQL.Add(' and cliente_ds = :cliente  ');
    ParamByName('empresa').AsString:= AEmpresa;
    ParamByName('cliente').AsString:= ACliente;
    Open;
    result:= Fields[0].AsInteger > 0;
    Close;
  end;
end;

function TDDescripciones.desEmpresa(const empresa: string): string;
begin
  desEmpresa := '';
  if Trim(empresa) = '' then Exit;
  Result := Descripcion(' select nombre_e from frf_empresas ' +
    ' where empresa_e=' + QuotedStr(empresa));
end;

function TDDescripciones.desCentro(const empresa, centro: string): string;
begin
  desCentro := '';
  if (Trim(empresa) = '') or (Trim(centro) = '') then Exit;
  Result := Descripcion(' select descripcion_c from frf_centros ' +
    ' where empresa_c=' + QuotedStr(empresa) + ' ' +
    ' and centro_c=' + QuotedStr(centro) + ' ');
end;

function TDDescripciones.desCliente(const empresa, cliente: string): string;
begin
  desCliente := '';
  if (Trim(empresa) = '') or (Trim(cliente) = '') then Exit;
  Result := Descripcion(' select nombre_c from frf_clientes ' +
    ' where empresa_c=' + QuotedStr(empresa) + ' ' +
    ' and cliente_c=' + QuotedStr(cliente) + ' ');
end;

function TDDescripciones.desProducto(const empresa, producto: string): string;
begin
  desProducto := '';
  if (Trim(producto) = '') then Exit;
  Result := Descripcion(' select descripcion_p from frf_productos ' +
    ' where producto_p=' + QuotedStr(producto) + ' ');
end;

function TDDescripciones.desProductoAlta(const producto: string): string;
begin
  desProductoAlta := '';
  if (Trim(producto) = '') then Exit;
  Result := Descripcion(' select descripcion_p from frf_productos ' +
    ' where producto_p=' + QuotedStr(producto) + ' and fecha_baja_p is null ');
end;

function TDDescripciones.desTransporte(const empresa, transporte: string): string;
begin
  desTransporte := '';
  if (Trim(transporte) = '') then Exit;
  Result := Descripcion(' select descripcion_c from frf_camiones ' +
    ' where camion_c=' + transporte + ' ');
end;

function TDDescripciones.desPais(const pais: string): string;
begin
  desPais := '';
  if Trim(pais) = '' then Exit;
  Result := Descripcion(' select descripcion_p from frf_paises ' +
    ' where pais_p=' + QuotedStr(pais));
end;

function TDDescripciones.desMoneda(const moneda: string): string;
begin
  desMoneda := '';
  if Trim(moneda) = '' then Exit;
  Result := Descripcion(' select descripcion_m from frf_monedas ' +
    ' where moneda_m=' + QuotedStr(moneda));
end;

function TDDescripciones.desProvincia(const codPostal: string): string;
begin
  desProvincia := '';
  if Trim(codPostal) = '' then Exit;
  Result := Descripcion(' select nombre_p from frf_provincias ' +
    ' where codigo_p=' + QuotedStr(Copy(codPostal, 1, 2)));
end;

function TDDescripciones.desColor(const empresa, producto, color: string): string;
begin
  desColor := '';
  if (Trim(producto) = '') or (Trim(color) = '') then Exit;
  Result := Descripcion(' select descripcion_c from frf_colores ' +
    ' where producto_c=' + QuotedStr(producto) +
    ' and color_c=' + QuotedStr(color));
end;

function TDDescripciones.desMarca(const marca: string): string;
begin
  desMarca := '';
  if Trim(marca) = '' then Exit;
  Result := Descripcion(' select descripcion_m from frf_marcas ' +
    ' where codigo_m=' + QuotedStr(marca));
end;

function TDDescripciones.desTipoPalet(const palet: string): string;
begin
  desTipoPalet := '';
  if Trim(palet) = '' then Exit;
  Result := Descripcion(' select descripcion_tp from frf_tipo_palets ' +
    ' where codigo_tp=' + QuotedStr(palet));
end;

function TDDescripciones.desEnvase(const empresa, envase: string): string;
var
  sEmpresa: string;
begin
  desEnvase := '';
  if empresa = '' then
    sEmpresa := '050'
  else
    sEmpresa := empresa;
  if Trim(envase) = '' then Exit;
  Result := Descripcion(' select descripcion_e from frf_envases ' +
    ' where envase_e=' + QuotedStr(envase) );
end;

function TDDescripciones.desEnvaseComercial(const AEan13: string): string;
begin
  desEnvaseComercial := '';
  if Trim(AEan13) = '' then Exit;
  Result := Descripcion(' select descripcion_e ' +
                        ' from frf_ean13 ' +
                        ' where codigo_e = ' + QuotedStr(AEan13) );
end;

function TDDescripciones.desEnvaseCliente(const empresa, producto, envase, cliente: string;
  const esEspanyol: integer = -1): string;
var
  enEspanyol: boolean;
begin
  desEnvaseCliente := '';
  Result := Descripcion(' select descripcion_ce from frf_clientes_env ' +
    ' where empresa_ce ' + SQLEqualS(empresa) +
    '   and producto_ce ' + SQLEqualS(producto) +
    '   and envase_ce ' + SQLEqualS(envase) +
    '   and cliente_ce ' + SQLEqualS(cliente));
  if Result = '' then
  begin
    if esEspanyol = -1 then
    begin
      with DDescripciones.QDescripciones do
      begin
        SQL.Text := ' select pais_c ' +
          ' from frf_clientes ' +
          ' where empresa_c=' + QuotedStr(empresa) +
          '   and cliente_c=' + QuotedStr(cliente);
        try
          try
            Open;
            if IsEmpty then
              enEspanyol := true;
            enEspanyol := Fields[0].AsString = 'ES';
          except
            enEspanyol := true;
          end;
        finally
          Cancel;
          Close;
        end;
      end;
    end
    else
    begin
      enEspanyol := esEspanyol = 1;
    end;

    with DDescripciones.QDescripciones do
    begin
      SQL.Text := ' select descripcion_e, descripcion2_e ' +
        ' from frf_envases ' +
        ' where envase_e=' + QuotedStr(envase) +
        ' and empresa_e=' + QuotedStr(empresa);
      try
        try
          Open;
          if IsEmpty then
          begin
            result := '';
            Exit;
          end;
        except
          result := '';
          Exit;
        end;

        if enEspanyol then
        begin
          Result := Fields[0].AsString;
        end
        else
        begin
          if Fields[1].AsString <> '' then
          begin
            Result := Fields[1].AsString;
          end
          else
          begin
            Result := Fields[0].AsString;
          end;
        end;

      finally
        Cancel;
        Close;
      end;
    end;
  end;
end;

function TDDescripciones.desEnvaseClienteEx(const empresa, producto, envase, cliente: string;
  const esEspanyol: integer = -1): string;
begin
  result := desEnvaseCliente(empresa, producto, envase, cliente, esEspanyol);
end;

function TDDescripciones.desCategoria(const empresa, producto, catego: string): string;
begin
  desCategoria := '';
  if (Trim(producto) = '') or (Trim(catego) = '') then Exit;
  Result := Descripcion(' select descripcion_c from frf_categorias ' +
    ' where producto_c=' + QuotedStr(producto) +
    ' and categoria_c=' + QuotedStr(catego));
end;

function TDDescripciones.desSuministro(const empresa, cliente, dirSum: string): string;
begin
  desSuministro := '';
  if (Trim(empresa) = '') or (Trim(cliente) = '') or (Trim(dirSum) = '') then Exit;
  if TieneSuministros( empresa, cliente) then
  begin
    Result := Descripcion(' select nombre_ds from frf_dir_sum ' +
      ' where empresa_ds=' + QuotedStr(empresa) + ' ' +
      ' and cliente_ds=' + QuotedStr(cliente) +
      ' and dir_sum_ds=' + QuotedStr(dirSum));
    if Result = '' then
    begin
      Result := desCliente( empresa, dirSum );
    end;
  end
  else
  begin
    Result := desCliente( empresa, dirSum );
  end;
end;

function TDDescripciones.desCosechero(const empresa, cosechero: string): string;
begin
  desCosechero := '';
  if (Trim(empresa) = '') or (Trim(cosechero) = '') then Exit;
  Result := Descripcion(' select nombre_c from frf_cosecheros ' +
    ' where empresa_c=' + QuotedStr(empresa) + ' ' +
    ' and cosechero_c=' + QuotedStr(cosechero) + ' ');
end;

function TDDescripciones.desVariedad(const empresa, producto, codigo: string): string;
begin
  Result := '';
  if (Trim(producto) = '') or (Trim(codigo) = '') then
    Exit;
  Result := Descripcion(' select descripcion_pv from frf_productos_variedad ' +
    ' where producto_pv=' + QuotedStr(producto) + ' ' +
    ' and codigo_pv=' + codigo + ' ');
end;

function TDDescripciones.EsProductoAlta(const producto: string): boolean;
begin
  with QAux do
  begin
    SQL.Clear;
    SQL.Add(' select * from frf_productos ' );
    SQL.Add(' where producto_p = ' + QuotedStr(producto) );
    SQL.Add('   and fecha_baja_p is null ');
    Open;
    Result:= not IsEmpty;
    Close;
  end;

end;

function TDDescripciones.desPlantacion(empresa, producto, cosechero, plantacion, anyoSemana: string): string;
begin
  if (Trim(empresa) <> '') and (Trim(cosechero) <> '') and
    (Trim(producto) <> '') and (Trim(plantacion) <> '') and
    (Trim(anyoSemana) <> '') then
  begin
    Result := Descripcion(' SELECT DISTINCT  descripcion_p ' +
      ' FROM frf_plantaciones ' +
      ' WHERE empresa_p=' + QuotedStr(empresa) + ' ' +
      '    AND producto_p=' + QuotedStr(producto) + ' ' +
      '    AND cosechero_p=' + cosechero +
      '    AND plantacion_p=' + plantacion +
      '    AND ano_semana_p=' + anyosemana );
  end
  else
  begin
    desPlantacion := '';
  end;
end;

function TDDescripciones.desFormato(const empresa, centro, producto, formato: string): string;
begin
  result := '';
  if (Trim(empresa) = '') or (Trim(centro) = '') or (Trim(producto) = '') or (Trim(formato) = '') then
    Exit;
  Result := Descripcion(' select nvl(descripcion_p,''FALTA DESCRIPCION'') from frf_pesos ' +
    ' where empresa_p=' + QuotedStr(empresa) + ' ' +
    ' and centro_p=' + QuotedStr(centro) + ' ' +
    ' and producto_p=' + QuotedStr(producto) + ' ' +
    ' and formato_p=' + formato + ' ');
end;

function TDDescripciones.CalcularAnoSemana(empresa, producto, cosechero, plantacion, fecha: string): string;
var
  sAux: string;
begin
  sAux := ' empresa_p= ' + QuotedStr(empresa) + ' ' +
    'AND producto_p= ' + QuotedStr(producto) + ' ' +
    'AND cosechero_p= ' + cosechero + ' ' +
    'AND plantacion_p= ' + plantacion + ' ';

  with Qaux do
  begin
    Qaux.SQL.Clear;
    Qaux.SQL.Add(' SELECT DISTINCT  fecha_inicio_p, ano_semana_p ano_semana' +
      ' FROM frf_plantaciones  ' +
      ' WHERE ' + sAux +
      ' AND fecha_inicio_p <=:fecha ' +
      ' and fecha_fin_p is null ' +
      ' ORDER BY fecha_inicio_p desc ');

    ParamByName('fecha').AsDateTime := StrToDate(fecha);
    Open;
    if not IsEmpty then
      CalcularAnoSemana := FieldByName('ano_semana').AsString
    else
      CalcularAnoSemana := '';
    Close;
  end;
end;

function TDDescripciones.desPlantacionEx(empresa, producto, cosechero, plantacion, fecha: string): string;
var
  anyosemana: string;
begin
  if (Trim(empresa) <> '') and (Trim(cosechero) <> '') and
    (Trim(producto) <> '') and (Trim(plantacion) <> '') then
  begin
    anyoSemana := CalcularAnoSemana(empresa, producto, cosechero, plantacion,
      fecha);
    desPlantacionEx := desPlantacion(empresa, producto, cosechero, plantacion, anyoSemana);
  end
  else
  begin
    desPlantacionEX := '';
  end;
end;


end.
