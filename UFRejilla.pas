(*TODO*)
(*Que el ancho de la rejilla sea dinamico segun contenido*)
unit UFRejilla;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, Grids, DBGrids, StdCtrls;

type
  TFRejilla = class(TForm)
    DBGrid: TDBGrid;
    Query: TQuery;
    DataSource: TDataSource;
    procedure DBGridDblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    bFlag: boolean;

  end;

  procedure InicializaModulo( const ABaseDatos: string );
  procedure FinalizaModulo;


  function SeleccionaEmpresa( const AForm: TForm; const AControl: TControl; var AResultado: string ): Boolean;
  function SeleccionaCentro( const AForm: TForm; const AControl: TControl; const AEmpresa: string; var AResultado: string ): Boolean;
  function SeleccionaCliente( const AForm: TForm; const AControl: TControl; const AEmpresa: string; var AResultado: string ): Boolean;
  function SeleccionaSuministro( const AForm: TForm; const AControl: TControl; const AEmpresa, ACliente: string; var AResultado: string ): Boolean;
  function SeleccionaMoneda( const AForm: TForm; const AControl: TControl; var AResultado: string ): Boolean;
  function SeleccionaTransportista( const AForm: TForm; const AControl: TControl; const AEmpresa: string; var AResultado: string ): Boolean;
  function SeleccionaProducto( const AForm: TForm; const AControl: TControl; const AEmpresa: string; var AResultado: string ): Boolean;
  function SeleccionaEnvase( const AForm: TForm; const AControl: TControl; const AEmpresa, AProducto: string; var AResultado: string ): Boolean;
  function SeleccionaEnvaseCliente( const AForm: TForm; const AControl: TControl; const AEmpresa, AProducto, ACliente: string; var AResultado: string ): Boolean;
  function SeleccionaMarca( const AForm: TForm; const AControl: TControl; var AResultado: string ): Boolean;
  function SeleccionaColor( const AForm: TForm; const AControl: TControl; const AEmpresa, AProducto: string; var AResultado: string ): Boolean;
  function SeleccionaCategoria( const AForm: TForm; const AControl: TControl; const AEmpresa, AProducto: string; var AResultado: string ): Boolean;
  function SeleccionaCalibre( const AForm: TForm; const AControl: TControl; const AEmpresa, AProducto: string; var AResultado: string ): Boolean;
  function SeleccionaCosechero( const AForm: TForm; const AControl: TControl; const AEmpresa: string; var AResultado: string ): Boolean;
  function SeleccionaPlantacion( const AForm: TForm; const AControl: TControl; const AEmpresa, ACosechero, AProducto, AFecha: string; var AResultado: string ): Boolean;
  function SeleccionaFormato( const AForm: TForm; const AControl: TControl; const AEmpresa, ACentro, AProducto: string; var AResultado: string ): Boolean;
  function SeleccionaVariedad( const AForm: TForm; const AControl: TControl; const AEmpresa, AProduco: string; var AResultado: string ): Boolean;


implementation

{$R *.dfm}

var
  FRejilla: TFRejilla;

procedure InicializaModulo( const ABaseDatos: string );
begin
  FRejilla:= TFRejilla.Create( Application );
  FRejilla.Query.DatabaseName:= ABaseDatos;
end;

procedure FinalizaModulo;
begin
  FreeAndNil( FRejilla );
end;

procedure TFRejilla.DBGridDblClick(Sender: TObject);
begin
  bFlag:= True;
  Close;
end;

procedure TFRejilla.FormShow(Sender: TObject);
begin
  bFlag:= False;
end;

procedure TFRejilla.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:= caHide;
end;

function SeleccionaEmpresa( const AForm: TForm; const AControl: TControl; var AResultado: string ): Boolean;
begin
  //FRejilla:= TFRejilla.Create( AForm );

  FRejilla.Left:= AControl.ClientOrigin.X;
  FRejilla.Top:= AControl.ClientOrigin.Y + AControl.Height;
  with FRejilla.Query do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT DISTINCT empresa_e Empresa, nombre_e Nombre');
    SQL.Add('FROM frf_empresas ');
    SQL.Add('ORDER BY empresa_e ');
    Open;
  end;

  try
    FRejilla.ShowModal;
    result:= FRejilla.bFlag;
    if result then
      AResultado:= FRejilla.Query.Fields[0].AsString;
  finally
    //FreeAndNil( FRejilla );
  end;
end;

function SeleccionaCentro( const AForm: TForm; const AControl: TControl;
                           const AEmpresa: string; var AResultado: string ): Boolean;
begin
  //FRejilla:= TFRejilla.Create( AForm );

  FRejilla.Left:= AControl.ClientOrigin.X;
  FRejilla.Top:= AControl.ClientOrigin.Y + AControl.Height;
  with FRejilla.Query do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT DISTINCT empresa_c Empresa, centro_c Centro, descripcion_c Nombre');
    SQL.Add('FROM frf_centros ');
    if Trim(AEmpresa) <> '' then
    begin
      SQL.Add('WHERE empresa_c = :empresa ');
      ParamByName('empresa').AsString:= AEmpresa;
    end;
    SQL.Add('ORDER BY empresa_c, centro_c ');
    Open;
  end;

  try
    FRejilla.ShowModal;
    result:= FRejilla.bFlag;
    if result then
      AResultado:= FRejilla.Query.Fields[1].AsString;
  finally
    //FreeAndNil( FRejilla );
  end;
end;

function SeleccionaCliente( const AForm: TForm; const AControl: TControl;
                           const AEmpresa: string; var AResultado: string ): Boolean;
begin
  //FRejilla:= TFRejilla.Create( AForm );

  FRejilla.Left:= AControl.ClientOrigin.X;
  FRejilla.Top:= AControl.ClientOrigin.Y + AControl.Height;
  with FRejilla.Query do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT DISTINCT empresa_c Empresa, cliente_c Cliente, nombre_c Nombre' +
          ' FROM frf_clientes ');
    if Trim(AEmpresa) <> '' then
    begin
      SQL.Add('WHERE empresa_c = :empresa ');
      ParamByName('empresa').AsString:= AEmpresa;
    end;
    SQL.Add('ORDER BY empresa_c, cliente_c ');
    Open;
  end;

  try
    FRejilla.ShowModal;
    result:= FRejilla.bFlag;
    if result then
      AResultado:= FRejilla.Query.Fields[1].AsString;
  finally
    //FreeAndNil( FRejilla );
  end;
end;

function SeleccionaSuministro( const AForm: TForm; const AControl: TControl;
                           const AEmpresa, ACliente: string; var AResultado: string ): Boolean;
var
  sWhere: string;
begin
  //FRejilla:= TFRejilla.Create( AForm );

  FRejilla.Left:= AControl.ClientOrigin.X;
  FRejilla.Top:= AControl.ClientOrigin.Y + AControl.Height;
  with FRejilla.Query do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT DISTINCT empresa_ds Empresa, cliente_ds Cliente, dir_sum_ds Suministro, nombre_ds Nombre, poblacion_ds Poblacion' +
          ' FROM frf_dir_sum ');

    sWhere:= '';
    if Trim(AEmpresa) <> '' then
    begin
      sWhere:= 'WHERE empresa_ds = :empresa ';
    end;
    if Trim(ACliente) <> '' then
    begin
      if sWhere <> '' then
      begin
        sWhere:= sWhere + #13 + #10 + 'AND cliente_ds = :cliente ';
      end
      else
      begin
        sWhere:= 'WHERE cliente_ds = :cliente ';
      end;
    end;
    SQL.Add( sWhere );
    if Trim(AEmpresa) <> '' then
    begin
      ParamByName('empresa').AsString:= AEmpresa;
    end;
    if Trim(ACliente) <> '' then
    begin
      ParamByName('cliente').AsString:= ACliente;
    end;

    SQL.Add('ORDER BY empresa_ds, cliente_ds, nombre_ds ');
    Open;
  end;

  try
    FRejilla.Width:= 550;
    FRejilla.ShowModal;
    result:= FRejilla.bFlag;
    if result then
      AResultado:= FRejilla.Query.Fields[2].AsString;
  finally
    FRejilla.Width:= 321;
    //FreeAndNil( FRejilla );
  end;
end;

function SeleccionaMoneda( const AForm: TForm; const AControl: TControl; var AResultado: string ): Boolean;
begin
  //FRejilla:= TFRejilla.Create( AForm );

  FRejilla.Left:= AControl.ClientOrigin.X;
  FRejilla.Top:= AControl.ClientOrigin.Y + AControl.Height;
  with FRejilla.Query do
  begin
    Close;
    SQL.Clear;
    SQL.Add(' SELECT DISTINCT moneda_m moneda, descripcion_m nombre');
    SQL.Add(' FROM frf_monedas ');
    SQL.Add(' ORDER BY descripcion_m ');
    Open;
  end;

  try
    FRejilla.ShowModal;
    result:= FRejilla.bFlag;
    if result then
      AResultado:= FRejilla.Query.Fields[0].AsString;
  finally
    //FreeAndNil( FRejilla );
  end;
end;

function SeleccionaTransportista( const AForm: TForm; const AControl: TControl;
                           const AEmpresa: string; var AResultado: string ): Boolean;
begin
  //FRejilla:= TFRejilla.Create( AForm );

  FRejilla.Left:= AControl.ClientOrigin.X;
  FRejilla.Top:= AControl.ClientOrigin.Y + AControl.Height;
  with FRejilla.Query do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT DISTINCT camion_c Transporte, descripcion_c Nombre' +
          ' FROM frf_camiones ');
    SQL.Add('ORDER BY camion_c ');
    Open;
  end;

  try
    FRejilla.ShowModal;
    result:= FRejilla.bFlag;
    if result then
      AResultado:= FRejilla.Query.Fields[1].AsString;
  finally
    //FreeAndNil( FRejilla );
  end;
end;

function SeleccionaProducto( const AForm: TForm; const AControl: TControl;
                           const AEmpresa: string; var AResultado: string ): Boolean;
begin
  //FRejilla:= TFRejilla.Create( AForm );

  FRejilla.Left:= AControl.ClientOrigin.X;
  FRejilla.Top:= AControl.ClientOrigin.Y + AControl.Height;
  with FRejilla.Query do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT DISTINCT producto_p Producto, descripcion_p Nombre' +
            ' FROM frf_productos ');
    SQL.Add(' WHERE fecha_baja_p is null ');
    SQL.Add('ORDER BY producto_p ');
    Open;
  end;

  try
    FRejilla.ShowModal;
    result:= FRejilla.bFlag;
    if result then
      AResultado:= FRejilla.Query.Fields[0].AsString;
  finally
    //FreeAndNil( FRejilla );
  end;
end;

function SeleccionaEnvase( const AForm: TForm; const AControl: TControl;
                           const AEmpresa, AProducto: string; var AResultado: string ): Boolean;
begin
  //FRejilla:= TFRejilla.Create( AForm );

  FRejilla.Left:= AControl.ClientOrigin.X;
  FRejilla.Top:= AControl.ClientOrigin.Y + AControl.Height;
  with FRejilla.Query do
  begin
    Close;
    SQL.Clear;

    SQL.Add('select DISTINCT envase_e envase, descripcion_e nombre ');
    SQL.Add('from frf_envases ');
    SQL.Add(' where 1=1 ');

    if Trim(AProducto) <> '' then
    begin
      SQL.Add('  and producto_e = :producto ');
      ParamByName('producto').AsString:= AProducto;
    end;

    SQL.Add('and fecha_baja_e is null ');
    SQL.Add('ORDER BY envase_e ');
    Open;
  end;

  try
    FRejilla.ShowModal;
    result:= FRejilla.bFlag;
    if result then
      AResultado:= FRejilla.Query.Fields[0].AsString;
  finally
    //FreeAndNil( FRejilla );
  end;
end;

function SeleccionaEnvaseCliente( const AForm: TForm; const AControl: TControl;
                             const AEmpresa, AProducto, ACliente: string;
                             var AResultado: string ): Boolean;
var
  bFlag: Boolean;
begin
  //FRejilla:= TFRejilla.Create( AForm );

  FRejilla.Left:= AControl.ClientOrigin.X;
  FRejilla.Top:= AControl.ClientOrigin.Y + AControl.Height;
  with FRejilla.Query do
  begin
    (*TODO*)
    (*El informix del almacen no acepta la oreden case*)
    Close;
    SQL.Clear;
    SQL.Add('select DISTINCT empresa_ce empresa, envase_ce envase, ');
    SQL.Add('       ( select descripcion_e from frf_envases where envase_e = envase_ce and producto_e = producto_ce ) nombre ');
(*
    SQL.Add('       case when descripcion_ce is not null then descripcion_ce else ');
    SQL.Add('       ( select descripcion_e from frf_envases where empresa_e = empresa_ce ');
    SQL.Add('                            and envase_e = envase_ce and producto_base_e = producto_base_ce ) end nombre ');
*)

    SQL.Add('from frf_clientes_env ');

    bFlag:= False;
    if Trim(AEmpresa) <> '' then
    begin
      SQL.Add('WHERE empresa_ce = :empresa ');
      if Trim(AProducto) <> '' then
      begin
        SQL.Add('  and producto_ce = :producto ');
        ParamByName('producto').AsString:= AProducto;
      end;
      ParamByName('empresa').AsString:= AEmpresa;
      bFlag:= True;
    end;
    if Trim(ACliente) <> '' then
    begin
      if not bFlag then
      begin
        SQL.Add('  Where cliente_ce = :cliente ');
        bFlag:= True;
      end
      else
      begin
        SQL.Add('  and cliente_ce = :cliente ');
      end;
      ParamByName('cliente').AsString:= ACliente;
    end;

    if bFlag then
    begin
      SQL.Add('and exists ( select envase_e from frf_envases where envase_e = envase_ce and producto_e = producto_ce and fecha_baja_e is  null ) ');
    end
    else
    begin
      SQL.Add('where exists ( select envase_e from frf_envases where envase_e = envase_ce and producto_e = producto_ce and fecha_baja_e is  null ) ');
    end;

    SQL.Add('ORDER BY empresa_ce, envase_ce ');
    Open;
  end;

  try
    FRejilla.ShowModal;
    result:= FRejilla.bFlag;
    if result then
      AResultado:= FRejilla.Query.Fields[1].AsString;
  finally
    //FreeAndNil( FRejilla );
  end;
end;


function SeleccionaMarca( const AForm: TForm; const AControl: TControl; var AResultado: string ): Boolean;
begin
  //FRejilla:= TFRejilla.Create( AForm );

  FRejilla.Left:= AControl.ClientOrigin.X;
  FRejilla.Top:= AControl.ClientOrigin.Y + AControl.Height;
  with FRejilla.Query do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT codigo_m, descripcion_m ');
    SQL.Add('FROM frf_marcas ');
    SQL.Add('ORDER BY codigo_m ');
    Open;
  end;

  try
    FRejilla.ShowModal;
    result:= FRejilla.bFlag;
    if result then
      AResultado:= FRejilla.Query.Fields[0].AsString;
  finally
    //FreeAndNil( FRejilla );
  end;
end;

function SeleccionaColor( const AForm: TForm; const AControl: TControl;
                           const AEmpresa, AProducto: string; var AResultado: string ): Boolean;
begin
  //FRejilla:= TFRejilla.Create( AForm );

  FRejilla.Left:= AControl.ClientOrigin.X;
  FRejilla.Top:= AControl.ClientOrigin.Y + AControl.Height;
  with FRejilla.Query do
  begin
    Close;
    SQL.Clear;

    SQL.Add('select producto_c producto, color_c color, descripcion_c nombre ');
    SQL.Add('from frf_colores ');

    if Trim(AProducto) <> '' then
    begin
      SQL.Add('  Where producto_c  = :producto ');
      ParamByName('producto').AsString:= AProducto;
    end;
    SQL.Add('order by producto_c, color_c ');
    Open;
  end;

  try
    FRejilla.ShowModal;
    result:= FRejilla.bFlag;
    if result then
      AResultado:= FRejilla.Query.Fields[1].AsString;
  finally
    //FreeAndNil( FRejilla );
  end;
end;

function SeleccionaCategoria( const AForm: TForm; const AControl: TControl;
                           const AEmpresa, AProducto: string; var AResultado: string ): Boolean;
begin
  //FRejilla:= TFRejilla.Create( AForm );

  FRejilla.Left:= AControl.ClientOrigin.X;
  FRejilla.Top:= AControl.ClientOrigin.Y + AControl.Height;
  with FRejilla.Query do
  begin
    Close;
    SQL.Clear;

    SQL.Add('select producto_c producto, categoria_c categoria, descripcion_c nombre ');
    SQL.Add('from frf_categorias ');

    if Trim(AProducto) <> '' then
    begin
      SQL.Add('  Where producto_c  = :producto ');
      ParamByName('producto').AsString:= AProducto;
    end;
    SQL.Add('order by producto_c, categoria_c ');
    Open;
  end;

  try
    FRejilla.ShowModal;
    result:= FRejilla.bFlag;
    if result then
      AResultado:= FRejilla.Query.Fields[1].AsString;
  finally
    //FreeAndNil( FRejilla );
  end;
end;

function SeleccionaCalibre( const AForm: TForm; const AControl: TControl;
                           const AEmpresa, AProducto: string; var AResultado: string ): Boolean;
begin
  //FRejilla:= TFRejilla.Create( AForm );

  FRejilla.Left:= AControl.ClientOrigin.X;
  FRejilla.Top:= AControl.ClientOrigin.Y + AControl.Height;
  with FRejilla.Query do
  begin
    Close;
    SQL.Clear;

    SQL.Add('select producto_c producto, calibre_c calibre ');
    SQL.Add('from frf_calibres ');

    if Trim(AProducto) <> '' then
    begin
      SQL.Add('  Where producto_c  = :producto ');
      ParamByName('producto').AsString:= AProducto;
    end;

    SQL.Add('order by producto_c, calibre_c ');
    Open;
  end;

  try
    FRejilla.ShowModal;
    result:= FRejilla.bFlag;
    if result then
      AResultado:= FRejilla.Query.Fields[1].AsString;
  finally
    //FreeAndNil( FRejilla );
  end;
end;

function SeleccionaCosechero( const AForm: TForm; const AControl: TControl; const AEmpresa: string; var AResultado: string ): Boolean;
begin
  FRejilla.Left:= AControl.ClientOrigin.X;
  FRejilla.Top:= AControl.ClientOrigin.Y + AControl.Height;
  with FRejilla.Query do
  begin
    Close;
    SQL.Clear;

    SQL.Add('select empresa_c empresa, cosechero_c cosechero, nombre_c nombre ');
    SQL.Add('from frf_cosecheros ');

    if Trim(AEmpresa) <> '' then
    begin
      SQL.Add('WHERE empresa_c = :empresa ');
      ParamByName('empresa').AsString:= AEmpresa;
    end;

    SQL.Add('order by empresa_c, cosechero_c ');
    Open;
  end;

  try
    FRejilla.ShowModal;
    result:= FRejilla.bFlag;
    if result then
      AResultado:= FRejilla.Query.Fields[1].AsString;
  finally

  end;
end;

function SeleccionaVariedad( const AForm: TForm; const AControl: TControl; const AEmpresa, AProduco: string; var AResultado: string ): Boolean;
begin
  FRejilla.Left:= AControl.ClientOrigin.X;
  FRejilla.Top:= AControl.ClientOrigin.Y + AControl.Height;
  with FRejilla.Query do
  begin
    Close;
    SQL.Clear;

    SQL.Add('select producto_pv producto, codigo_pv codigo, descripcion_pv variedad ');
    SQL.Add('from frf_productos_variedad ');

    if Trim(AProduco) <> '' then
    begin
      SQL.Add('where producto_pv = :producto ');
      ParamByName('producto').AsString:= AProduco;
    end;

    SQL.Add('order by producto, codigo ');
    Open;
  end;

  if FRejilla.Query.IsEmpty then
  begin
    ShowMessage('Sin variedades para el producto seleccionado, si es necesario por favor grabe las variedades ' + #13 + #10 +
                'en el mantenimeinto de "Ficheros/Productos" en la pestaña "Variedad" del programa de gestión comercial.');
  end
  else
  try
    FRejilla.ShowModal;
    result:= FRejilla.bFlag;
    if result then
      AResultado:= FRejilla.Query.Fields[1].AsString;
  finally

  end;
end;

function SeleccionaPlantacion( const AForm: TForm; const AControl: TControl; const AEmpresa, ACosechero, AProducto, AFecha: string; var AResultado: string ): Boolean;
begin
  //FRejilla:= TFRejilla.Create( AForm );

  FRejilla.Left:= AControl.ClientOrigin.X;
  FRejilla.Top:= AControl.ClientOrigin.Y + AControl.Height;
  with FRejilla.Query do
  begin
    Close;
    SQL.Clear;

    SQL.Add('select ano_semana_p Anyo_Semana, empresa_p empresa, cosechero_p cosechero, ');
    SQL.Add('       producto_p producto, plantacion_p plantacion, descripcion_p descripcion ');
    SQL.Add('from frf_plantaciones ');
    SQL.Add('WHERE fecha_fin_p is null');

    if Trim(AEmpresa) <> '' then
    begin
      SQL.Add('and empresa_p = :empresa ');
      ParamByName('empresa').AsString:= AEmpresa;
    end;
    if Trim(ACosechero) <> '' then
    begin
      SQL.Add('and cosechero_p  = :cosechero ');
      ParamByName('cosechero').AsString:= ACosechero;
    end;
    if Trim(AProducto) <> '' then
    begin
      SQL.Add('and producto_p  = :producto ');
      ParamByName('producto').AsString:= AProducto;
    end;
    if Trim(AFecha) <> '' then
    begin
      SQL.Add('and fecha_inicio_p  <= :fecha ');
      ParamByName('fecha').AsDateTime:= StrToDateDef( AFecha, Date );
    end;

    SQL.Add('order by ano_semana_p, empresa_p, cosechero_p, producto_p, plantacion_p ');
    Open;
  end;

  try
    FRejilla.ShowModal;
    result:= FRejilla.bFlag;
    if result then
      AResultado:= FRejilla.Query.Fields[4].AsString;
  finally
    //FreeAndNil( FRejilla );
  end;
end;

function SeleccionaFormato( const AForm: TForm; const AControl: TControl; const AEmpresa, ACentro, AProducto: string; var AResultado: string ): Boolean;
begin
  //FRejilla:= TFRejilla.Create( AForm );

  FRejilla.Left:= AControl.ClientOrigin.X;
  FRejilla.Top:= AControl.ClientOrigin.Y + AControl.Height;
  with FRejilla.Query do
  begin
    Close;
    SQL.Clear;

    SQL.Add('select formato_p formato, nvl(descripcion_p,''FALTA DESCRIPCION'') descripcion ');
    SQL.Add('from frf_pesos ');
    SQL.Add('WHERE empresa_p = :empresa ');
    ParamByName('empresa').AsString:= AEmpresa;
    SQL.Add('and centro_p  = :centro ');
    ParamByName('centro').AsString:= ACentro;
    SQL.Add('and producto_p  = :producto ');
    ParamByName('producto').AsString:= AProducto;
    SQL.Add('order by formato_p, descripcion_p ');
    Open;
  end;

  try
    FRejilla.ShowModal;
    result:= FRejilla.bFlag;
    if result then
      AResultado:= FRejilla.Query.Fields[0].AsString;
  finally
    //FreeAndNil( FRejilla );
  end;
end;

procedure TFRejilla.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    vk_return:
      begin
        bFlag:= True;
        Close;
      end;
    vk_escape:
      begin
        Close;
      end;
  end;
end;

end.
