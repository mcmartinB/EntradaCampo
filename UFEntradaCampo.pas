unit UFEntradaCampo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ImgList, ComCtrls, ToolWin, ExtCtrls, DB, DBTables,
  Grids, DBGrids, nbLabels, BEdit, BDEdit, Buttons, BSpeedButton,
  BGridButton, DBCtrls;

const
   kVisualizar = 0;
   kNuevaCabecera = 1;
   kEditarCabecera = 2;
   kNuevoDetalle = 3;
   kEditarDetalle = 4;

type
  TFEntradaCampo = class(TForm)
    PMaestro: TPanel;
    PInferior: TPanel;
    ToolBar1: TToolBar;
    sep1: TToolButton;
    btnAlta: TToolButton;
    btnEditarC: TToolButton;
    btnBorrar: TToolButton;
    btnLocalizar: TToolButton;
    sep2: TToolButton;
    btnAltaD: TToolButton;
    btnEditarD: TToolButton;
    btnBorrarD: TToolButton;
    sep3: TToolButton;
    btnImprimir: TToolButton;
    ToolButton1: TToolButton;
    btnPrimero: TToolButton;
    btnAnterior: TToolButton;
    btnProximo: TToolButton;
    btnUltimo: TToolButton;
    sep5: TToolButton;
    btnAceptar: TToolButton;
    btnCancelar: TToolButton;
    ImageList: TImageList;
    lblEMPRESA: TLabel;
    lblCentro: TLabel;
    lblNENTRADA: TLabel;
    lblPRODUCTO: TLabel;
    lblFECHA: TLabel;
    lblHORA: TLabel;
    lblTRANSPORTE: TLabel;
    lblPESOBRUTO: TLabel;
    lblPESONETO: TLabel;
    lblTOTALPALETS: TLabel;
    lblTOTALCAJAS: TLabel;
    RVisualizacion: TDBGrid;
    QEntradaCampoC: TQuery;
    DSMaestro: TDataSource;
    QEntradaCampoL: TQuery;
    DSDetalle: TDataSource;
    PDetalle: TPanel;
    lblCAJAS: TLabel;
    lblNPALET: TLabel;
    centro_Ec: TBDEdit;
    empresa_ec: TBDEdit;
    transportista_ec: TBDEdit;
    fecha_ec: TBDEdit;
    producto_ec: TBDEdit;
    peso_bruto_ec: TBDEdit;
    hora_Ec: TBDEdit;
    peso_neto_ec: TBDEdit;
    total_cajas_ec: TBDEdit;
    numero_entrada_ec: TBDEdit;
    total_palets_ec: TBDEdit;
    nomEmpresa: TnbStaticText;
    nomCentro: TnbStaticText;
    nomProducto: TnbStaticText;
    nomTransporte: TnbStaticText;
    total_cajas_e1l: TBDEdit;
    codigo_palet_e1l: TBDEdit;
    btnEmpresa: TBGridButton;
    btnCentro: TBGridButton;
    btnProducto: TBGridButton;
    btnTransportistas: TBGridButton;
    btnFecha: TBGridButton;
    QEntradaCampoCempresa_ec: TStringField;
    QEntradaCampoCcentro_ec: TStringField;
    QEntradaCampoCnumero_entrada_ec: TIntegerField;
    QEntradaCampoCproducto_ec: TStringField;
    QEntradaCampoCfecha_ec: TDateField;
    QEntradaCampoChora_ec: TStringField;
    QEntradaCampoCtransportista_ec: TSmallintField;
    QEntradaCampoCtotal_cajas_ec: TIntegerField;
    QEntradaCampoCtotal_palets_ec: TIntegerField;
    QEntradaCampoCpesar_palets_ec: TIntegerField;
    QEntradaCampoCpeso_bruto_ec: TFloatField;
    QEntradaCampoCpeso_neto_ec: TFloatField;
    QEntradaCampoCprecio_liq_ec: TFloatField;
    QEntradaCampoCobservacion_ec: TMemoField;
    QEntradaCampoLempresa_e1l: TStringField;
    QEntradaCampoLcentro_e1l: TStringField;
    QEntradaCampoLnumero_entrada_e1l: TIntegerField;
    QEntradaCampoLfecha_e1l: TDateField;
    QEntradaCampoLhora_e1l: TStringField;
    QEntradaCampoLtransportista_e1l: TSmallintField;
    QEntradaCampoLcosechero_e1l: TSmallintField;
    QEntradaCampoLplantacion_e1l: TSmallintField;
    QEntradaCampoLano_sem_planta_e1l: TStringField;
    QEntradaCampoLcodigo_palet_e1l: TStringField;
    QEntradaCampoLproducto_e1l: TStringField;
    QEntradaCampoLdespaletizador_e1l: TSmallintField;
    QEntradaCampoLfecha_conf_e1l: TDateField;
    QEntradaCampoLhora_conf_e1l: TStringField;
    QEntradaCampoLtotal_cajas_e1l: TIntegerField;
    QEntradaCampoLbruto_e1l: TFloatField;
    QEntradaCampoLkilos_e1l: TFloatField;
    QEntradaCampoLverde_e1l: TStringField;
    QEntradaCampoLkgs_cajaverde_e1l: TFloatField;
    QEntradaCampoLdes_plantacion_e1l: TStringField;
    lblFormato: TLabel;
    formato_e1l: TBDEdit;
    btnFormato: TBGridButton;
    stFormato: TnbStaticText;
    QEntradaCampoLformato_e1l: TIntegerField;
    QEntradaCampoLvariedad_e1l: TIntegerField;
    QEntradaCampoLdes_formato: TStringField;
    QEntradaCampoLdes_variedad: TStringField;
    lblCOSECHERO: TLabel;
    cosechero_e1l: TBDEdit;
    btnCosechero: TBGridButton;
    nomCosechero: TnbStaticText;
    nomPlantacion: TnbStaticText;
    btnPlantacion: TBGridButton;
    plantacion_e1l: TBDEdit;
    lblPLANTACION: TLabel;
    categoria_e1l: TComboBox;
    lblCategoria: TLabel;
    lbl1: TLabel;
    calibre_e1l: TComboBox;
    QEntradaCampoLcategoria_e1l: TIntegerField;
    QEntradaCampoLcalibre_e1l: TIntegerField;
    QEntradaCampoLdes_categoria: TStringField;
    QEntradaCampoLdes_calibre: TStringField;
    lblkilos_e1l: TLabel;
    bruto_e1l: TBDEdit;
    pesar_palets_ec: TDBCheckBox;
    Label1: TLabel;
    kilos_e1l: TBDEdit;
    lblVariedad: TLabel;
    variedad_e1l: TBDEdit;
    btnVariedad: TBGridButton;
    nomVariedad: TnbStaticText;
    fltfldQEntradaCampoLkilos_caja: TFloatField;
    lbl2: TLabel;
    edtkilos_caja: TBDEdit;
    fltfldQEntradaCampoCkilos_caja: TFloatField;
    lbl3: TLabel;
    edtkilos_caja_c: TBDEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnPrimeroClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure btnCerrarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnLocalizarClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnAltaClick(Sender: TObject);
    procedure empresa_ecChange(Sender: TObject);
    procedure centro_EcChange(Sender: TObject);
    procedure producto_ecChange(Sender: TObject);
    procedure transportista_ecChange(Sender: TObject);
    procedure btnEmpresaClick(Sender: TObject);
    procedure btnCentroClick(Sender: TObject);
    procedure btnProductoClick(Sender: TObject);
    procedure btnTransportistasClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnFechaClick(Sender: TObject);
    procedure btnEditarCClick(Sender: TObject);
    procedure btnBorrarClick(Sender: TObject);
    procedure btnAltaDClick(Sender: TObject);
    procedure btnEditarDClick(Sender: TObject);
    procedure btnBorrarDClick(Sender: TObject);
    procedure btnCosecheroClick(Sender: TObject);
    procedure btnPlantacionClick(Sender: TObject);
    procedure cosechero_e1lChange(Sender: TObject);
    procedure plantacion_e1lChange(Sender: TObject);
    procedure QEntradaCampoCAfterInsert(DataSet: TDataSet);
    procedure QEntradaCampoCBeforePost(DataSet: TDataSet);
    procedure numero_entrada_ecChange(Sender: TObject);
    procedure QEntradaCampoLBeforePost(DataSet: TDataSet);
    procedure QEntradaCampoLAfterCancel(DataSet: TDataSet);
    procedure QEntradaCampoLAfterInsert(DataSet: TDataSet);
    procedure QEntradaCampoCAfterPost(DataSet: TDataSet);
    procedure QEntradaCampoLCalcFields(DataSet: TDataSet);
    procedure btnImprimirClick(Sender: TObject);
    procedure btnFormatoClick(Sender: TObject);
    procedure formato_e1lChange(Sender: TObject);
    procedure QEntradaCampoLAfterEdit(DataSet: TDataSet);
    procedure variedad_e1lChange(Sender: TObject);
    procedure btnVariedadClick(Sender: TObject);
    procedure QEntradaCampoCAfterCancel(DataSet: TDataSet);
    procedure QEntradaCampoCCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    bPost: boolean;
    EstadoAnterior: integer;
    EstadoActual: integer;

    bEscape: boolean;

    iMaestros, iDetalles: integer;
    sSelectCab, sFromCab, sWhereCab, sOrderCab: string;
    sSelectLin, sFromLin, sWhereLin, sOrderLin: string;

    sFiltro: string;

    iContador, iContadorAutomatico: integer;
    bActualizarContador: Boolean;

    sCosechero, sPlantacion, sTransportista, sFormato: string;
    iCategoria, iCalibre, iCajas: Integer;

    bActualizarDetalle: Boolean;

    procedure CerrarMaestroDetalle;
    procedure AbrirMaestroDetalle;

    procedure HabilitarBarra;
    procedure DesHabilitarBarra;
    procedure ActualizarEstado( const AEstado: integer );
    procedure DesplegarRejilla( const AControl: TControl );

    procedure Visualizar;
    procedure InsertarC;
    procedure EditarC;
    procedure EditarD;
    procedure VisualizarEntrada( const AEmpresa, ACentro: string;
      const AEntrada: Integer; const AFecha: TDate );
    procedure RefrescarEntrada( const AEmpresa, ACentro: string;
      const AEntrada: Integer; const AFecha: TDate );
    procedure RefrescarDetalle;

    procedure FiltrarOrdenes;
    procedure BorrarEntradaActual( const APreguntar: Boolean );
    procedure BorrarDetalleActual( const APreguntar: Boolean );
    procedure AltaDetalle;

    procedure PutContadorAutomatico;

    function  ObtenerTaraCamion( const AEmpresa, ATransportista: string;
                                 var VPesoCamion: real; var VMsg: string ): boolean;
    function  ObtenerTaraPalet( const AEmpresa, ACentro, AProducto, AFormato: string;
                                var VPesoPalet, VPesoCaja: real; var VCajasPalet: Integer; var VMsg: string ): boolean;
    function  ExisteTaraCamion( const AEmpresa, ATransportista: string; var VMsg: string ): boolean;
    function  ExisteTaraPalet( const AEmpresa, ACentro, AProducto, AFormato: string; var VMsg: string ): boolean;

    procedure ResumenDetalle;
    procedure ActualizarCabecera( const APalets, ACajas: integer; const ABruto, ANeto: Real );
    procedure ActualizarDetalle( const ANetoCaja: real );
    function  TieneEscandallos: boolean;

    procedure DestararCamion( const ASectores: string );
    procedure PesarPalets( const ASectores: string );
    function  TaraPaletYCajas( const AEmpresa, ACentro, AProducto, AFormato: string;
                               const AFecha: TDateTime; const AEntrega, ACajas: Integer  ): real;
    procedure PesarPaletsStatus;
  public
    { Public declarations }
  end;

var
  FEntradaCampo: TFEntradaCampo;

implementation

{$R *.dfm}

uses
  UDEntradaCampo, UFFiltro, UDDescripciones, UFRejilla, UFTransportistas,
  UFCalendario, UQEntradaCampo, bMath;

function GetHoraActual: string;
var
  iHora, iMinuto, iSegundo, iMilisegundo: word;
begin
  DecodeTime( Time, iHora, iMinuto, iSegundo, iMilisegundo );
  if iHora < 10 then
    result:= '0' + IntToStr( iHora )
  else
    result:= IntToStr( iHora );
  if iMinuto < 10 then
    result:= result + ':0' + IntToStr( iMinuto )
  else
    result:= result + ':' + IntToStr( iMinuto );
  if iSegundo < 10 then
    result:= result + ':0' + IntToStr( iSegundo )
  else
    result:= result + ':' + IntToStr( iSegundo );
end;

procedure TFEntradaCampo.CerrarMaestroDetalle;
begin
  QEntradaCampoL.Cancel;
  QEntradaCampoL.Close;

  QEntradaCampoC.Cancel;
  QEntradaCampoC.Close;
end;

procedure TFEntradaCampo.AbrirmaestroDetalle;
begin
  QEntradaCampoL.Cancel;
  QEntradaCampoL.Close;

  QEntradaCampoC.Cancel;
  QEntradaCampoC.Close;

  DEntradaCampo.QAux.Cancel;
  DEntradaCampo.QAux.Close;

  DEntradaCampo.QAux.SQL.Clear;
  DEntradaCampo.QAux.SQL.Add( 'select count(*)' );
  DEntradaCampo.QAux.SQL.Add( sFromCab );
  DEntradaCampo.QAux.SQL.Add( sWhereCab );
  DEntradaCampo.QAux.Open;
  iMaestros:= DEntradaCampo.QAux.Fields[0].AsInteger;
  DEntradaCampo.QAux.Close;

  QEntradaCampoC.SQL.Clear;
  QEntradaCampoC.SQL.Add( sSelectCab );
  QEntradaCampoC.SQL.Add( sFromCab );
  QEntradaCampoC.SQL.Add( sWhereCab );
  QEntradaCampoC.SQL.Add( sOrderCab );
  QEntradaCampoC.Open;

  if not QEntradaCampoL.Prepared then
  begin
    QEntradaCampoL.SQL.Clear;
    QEntradaCampoL.SQL.Add( sSelectLin );
    QEntradaCampoL.SQL.Add( sFromLin );
    QEntradaCampoL.SQL.Add( sWhereLin );
    QEntradaCampoL.SQL.Add( sOrderLin );
    QEntradaCampoL.Prepare;
  end;
  QEntradaCampoL.Open;
  iDetalles:= QEntradaCampoL.RecordCount;
end;

procedure TFEntradaCampo.FormCreate(Sender: TObject);
begin
  bPost:= True;
  UDDescripciones.InicializaModulo( DEntradaCampo.Database.DatabaseName );
  UFRejilla.InicializaModulo( DEntradaCampo.Database.DatabaseName );
  UFTransportistas.InicializaModulo( DEntradaCampo.Database.DatabaseName );

  bEscape:= false;

  sSelectCab:= 'select *';
  sFromCab:= 'from frf_entradas_c';
  sWhereCab:= 'where fecha_ec = ' + DateToStr( Date );
  sOrderCab:= ' order by numero_entrada_ec ';
  sFiltro:= sWhereCab;

  sSelectLin:= 'select *';
  sFromLin:= 'from frf_entradas1_l';
  sWhereLin:= 'where empresa_e1l = :empresa_ec ' +
              '  and centro_e1l = :centro_ec ' +
              '  and numero_entrada_e1l = :numero_entrada_ec ' +
              '  and fecha_e1l = :fecha_ec ';
  sOrderLin:= ' order by codigo_palet_e1l ';

  AbrirMaestroDetalle;
  ActualizarEstado( kVisualizar );

  bActualizarContador:= True;
  bActualizarDetalle:= False;

  sCosechero:= '';
  sPlantacion:= '';
  sFormato:= '';
  iCajas:= 0;
  iCategoria:= -1;
  iCalibre:= -1;
end;

procedure TFEntradaCampo.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose:=
    (Application.MessageBox('¿Seguro que desea cerrar la aplicación?', 'CERRAR APLICACIÓN', MB_YESNO ) = IDYES );
end;

procedure TFEntradaCampo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CerrarMaestroDetalle;
  if QEntradaCampoL.Prepared then
  begin
    QEntradaCampoL.Unprepare;
  end;

  UDDescripciones.FinalizaModulo;
  UFRejilla.FinalizaModulo;
  UFTransportistas.FinalizaModulo;
end;

procedure TFEntradaCampo.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if EstadoActual <> kVisualizar then
  begin
    case Key of
      vk_return, vk_down:
        PostMessage(Handle, WM_NEXTDLGCTL, 0, 0);
      vk_up:
        PostMessage(Handle, WM_NEXTDLGCTL, 1, 0);
      vk_f2:
        DesplegarRejilla( self.ActiveControl );
    end;
  end;
end;

procedure TFEntradaCampo.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if EstadoActual = kVisualizar then
  begin
    case Key of
      VK_ADD:
            if ssShift in Shift then
            begin
              if btnAltaD.Enabled then
                btnAltaD.Click;
            end
            else
            begin
              if btnAlta.Enabled then
                btnAlta.Click;
            end;
      VK_SUBTRACT:
            if ssShift in Shift then
            begin
              if btnBorrarD.Enabled then
                btnBorrarD.Click;
            end
            else
            begin
              if btnBorrar.Enabled then
                btnBorrar.Click;
            end;
      Ord('M'):
            if ssShift in Shift then
            begin
              if btnEditarD.Enabled then
                btnEditarD.Click;
            end
            else
            begin
              if btnEditarC.Enabled then
                btnEditarC.Click;
            end;
      Ord('L'):
            if btnLocalizar.Enabled then
              btnLocalizar.Click;
      vk_f1:
            if btnAceptar.Enabled then
              btnAceptar.Click;
      vk_escape:
            if btnCancelar.Enabled then
              btnCancelar.Click;
      vk_left:
            if btnAnterior.Enabled then
              btnAnterior.Click;
      vk_up:
            if btnPrimero.Enabled then
              btnPrimero.Click;
      vk_right:
            if btnProximo.Enabled then
              btnProximo.Click;
      vk_down:
            if btnUltimo.Enabled then
              btnUltimo.Click;
      Ord('I'):
            if btnImprimir.Enabled then
              btnImprimir.Click;
    end;
  end
  else
  begin
    case Key of
      vk_f1:
            btnAceptar.Click;
      vk_escape:
            btnCancelar.Click;
    end;
  end;
end;

procedure TFEntradaCampo.DesplegarRejilla( const AControl: TControl );
var
  sAux: string;
begin
  sAux:= TEdit( AControl ).Text;

  if AControl.Name = fecha_ec.Name then
  begin
    PonFecha( self, AControl, SAux, sAux );
  end
  else
  if AControl.Name = empresa_ec.Name then
  begin
    SeleccionaEmpresa( self, AControl, SAux );
  end
  else
  if AControl.Name = centro_ec.Name then
  begin
    SeleccionaCentro( self, AControl, empresa_ec.Text, SAux );
  end
  else
  if ( AControl.Name = producto_ec.Name ) then
  begin
    SeleccionaProducto( self, AControl, empresa_ec.Text, SAux );
  end
  else
  if ( AControl.Name = transportista_ec.Name ) then
  begin
    UFTransportistas.SeleccionaTransportista( self, AControl, empresa_ec.Text, SAux );
  end
  else
  if ( AControl.Name = cosechero_e1l.Name ) then
  begin
    SeleccionaCosechero( self, AControl, empresa_ec.Text, SAux );
  end
  else
  if ( AControl.Name = plantacion_e1l.Name ) then
  begin
    SeleccionaPlantacion( self, AControl, empresa_ec.Text, cosechero_e1l.Text, producto_ec.Text, fecha_ec.Text,  SAux );
  end
  else
  if ( AControl.Name = formato_e1l.Name ) then
  begin
    SeleccionaFormato( self, AControl, empresa_ec.Text, centro_Ec.Text, producto_ec.Text, SAux );
  end;

  TEdit( AControl ).Text:= sAux;
end;

procedure TFEntradaCampo.HabilitarBarra;
begin
  btnAlta.Enabled:= QEntradaCampoC.Active;
  btnEditarC.Enabled:= QEntradaCampoC.Active and ( not QEntradaCampoC.IsEmpty );
  btnBorrar.Enabled:= QEntradaCampoC.Active and ( not QEntradaCampoC.IsEmpty );
  btnLocalizar.Enabled:= True;

  btnAltaD.Enabled:= QEntradaCampoC.Active and ( not QEntradaCampoC.IsEmpty );
  btnBorrarD.Enabled:= QEntradaCampoC.Active and ( not QEntradaCampoC.IsEmpty ) and ( not QEntradaCampoL.IsEmpty );
  btnEditarD.Enabled:= QEntradaCampoC.Active and ( not QEntradaCampoC.IsEmpty ) and ( not QEntradaCampoL.IsEmpty );

  btnPrimero.Enabled:= QEntradaCampoC.Active and ( not QEntradaCampoC.Bof );
  btnAnterior.Enabled:= QEntradaCampoC.Active and ( not QEntradaCampoC.Bof );
  btnProximo.Enabled:= QEntradaCampoC.Active and ( not QEntradaCampoC.Eof );
  btnUltimo.Enabled:= QEntradaCampoC.Active and ( not QEntradaCampoC.Eof );

  btnImprimir.Enabled:= not QEntradaCampoC.IsEmpty;

  btnCancelar.OnClick:= btnCerrarClick;
  btnCancelar.hint:= 'Cerrar la aplicación (Esc)';
  btnCancelar.ImageIndex:= 14;

  btnAceptar.Enabled:= False;
  btnAceptar.hint:= '';
  btnAceptar.ImageIndex:= -1;
  btnAceptar.Down:= True;
end;

procedure TFEntradaCampo.DesHabilitarBarra;
begin
  btnAlta.Enabled:= False;
  btnEditarC.Enabled:= False;
  btnBorrar.Enabled:= False;
  btnLocalizar.Enabled:= False;

  btnAltaD.Enabled:= False;
  btnBorrarD.Enabled:= False;
  btnEditarD.Enabled:= False;

  btnPrimero.Enabled:= False;
  btnAnterior.Enabled:= False;
  btnProximo.Enabled:= False;
  btnUltimo.Enabled:= False;

  btnImprimir.Enabled:= False;

  btnCancelar.OnClick:= btnCancelarClick;
  btnCancelar.ImageIndex:= 13;
  btnCancelar.hint:= 'Cancelar (Esc)';

  btnAceptar.OnClick:= btnAceptarClick;
  btnAceptar.Enabled:= True;
  btnAceptar.hint:= 'Aceptar (F1)';
  btnAceptar.ImageIndex:= 12;
  btnAceptar.Down:= False;
end;

procedure TFEntradaCampo.ActualizarEstado( const AEstado: integer );
var
  sEmpresa, sCentro: string;
  dFecha: TDateTime;
  iEntrada: Integer;
begin
  EstadoAnterior:= EstadoActual;
  EstadoActual:= AEstado;

  sEmpresa:= empresa_ec.Text;
  sCentro:= centro_Ec.Text;
  iEntrada:= StrToIntDef( numero_entrada_ec.Text, 0 );
  dFecha:= StrToDate( '1/1/1999');
  dFecha:= StrToDateDef( fecha_ec.Text, dFecha );

  case AEstado of
    kVisualizar:
    begin
      Visualizar;
      if not bEscape then
      begin
        if ( EstadoAnterior = kNuevaCabecera ) then
        begin
          VisualizarEntrada( sEmpresa, sCentro, iEntrada, dFecha );
        end
        else
        if ( EstadoAnterior = kEditarCabecera )  then
        begin
          RefrescarEntrada( sEmpresa, sCentro, iEntrada, dFecha );
        end
        else
        if ( EstadoAnterior = kEditarDetalle ) or ( EstadoAnterior = kNuevoDetalle ) then
        begin
          RefrescarDetalle;
        end;
      end
      else
      begin
        bEscape:= false;
      end;
    end;
    kNuevaCabecera: InsertarC;
    kEditarCabecera: EditarC;
    kNuevoDetalle: EditarD;
    kEditarDetalle: EditarD;
  end;
end;

procedure TFEntradaCampo.VisualizarEntrada( const AEmpresa, ACentro: string;
  const AEntrada: Integer; const AFecha: TDate );
var
  bFlag: boolean;
begin
  with QEntradaCampoC do
  begin
    Close;
    SQL.Clear;
    SQL.Add( sSelectCab );
    SQL.Add( sFromCab );

    bFlag:= False;
    if AEmpresa <> '' then
    begin
      sFiltro:=  ' where empresa_ec = :empresa ';
      bFlag:= True;
    end;
    if ACentro <> '' then
    begin
      if bFlag then
      begin
        sFiltro:=  sFiltro + ' and ';
      end
      else
      begin
        sFiltro:=  ' where ';
        bFlag:= True;
      end;
      sFiltro:= sFiltro + ' centro_ec = :centro ';
    end;
    if AEntrada <> 0 then
    begin
      if bFlag then
      begin
        sFiltro:=  sFiltro + ' and ';
      end
      else
      begin
        sFiltro:=  ' where ';
        bFlag:= True;
      end;
      sFiltro:= sFiltro + ' numero_entrada_ec = :entrada';
    end;
    if AFecha <> StrToDate('1/1/1990') then
    begin
      if bFlag then
      begin
        sFiltro:=  sFiltro + ' and ';
      end
      else
      begin
        sFiltro:=  ' where ';
      end;
      sFiltro:= sFiltro + ' fecha_ec = :fecha';
    end;
    SQL.Add( sFiltro );


    if AEmpresa <> '' then
    begin
      ParamByName('empresa').AsString:= AEmpresa;
    end;
    if ACentro <> '' then
    begin
      ParamByName('centro').AsString:= ACentro;
    end;
    if AEntrada <> 0 then
    begin
      ParamByName('entrada').AsInteger:= AEntrada;
    end;
    if AFecha <> StrToDate('1/1/1990') then
    begin
      ParamByName('fecha').AsDateTime:= AFecha;
    end;

    try
      DisableControls;
      Open;
    finally
      EnableControls;
    end;
  end;
end;

procedure TFEntradaCampo.RefrescarEntrada( const AEmpresa, ACentro: string;
  const AEntrada: Integer; const AFecha: TDate );
begin
  with QEntradaCampoC do
  begin
    Close;
    try
      DisableControls;
      Open;
      Locate('empresa_ec;centro_ec;numero_entrada_ec;fecha_ec', VarArrayOf([ AEmpresa, ACentro, AEntrada, Afecha ]), []);
      HabilitarBarra;
    finally
      EnableControls;
    end;
  end;
end;

procedure TFEntradaCampo.RefrescarDetalle;
begin
  with QEntradaCampoL do
  begin
    Close;
    Open;
  end;
end;

procedure TFEntradaCampo.Visualizar;
begin
  PMaestro.Enabled:= False;
  PDetalle.Visible:= False;
  RVisualizacion.Enabled:= True;

  HabilitarBarra;

  empresa_ec.Enabled:= True;
  centro_Ec.Enabled:= True;
  numero_entrada_ec.Enabled:= True;
  fecha_ec.Enabled:= True;
  hora_ec.Enabled:= True;
  producto_ec.Enabled:= True;
  peso_neto_ec.Enabled:= True;
  total_cajas_ec.Enabled:= True;
  total_palets_ec.Enabled:= True;
end;

procedure TFEntradaCampo.InsertarC;
begin
  PMaestro.Enabled:= True;
  PDetalle.Visible:= False;
  RVisualizacion.Enabled:= False;

  DesHabilitarBarra;

  if empresa_ec.CanFocus then
      empresa_ec.SetFocus;

  peso_neto_ec.Enabled:= False;
  total_cajas_ec.Enabled:= False;
  total_palets_ec.Enabled:= False;
end;

procedure TFEntradaCampo.EditarC;
begin
  PMaestro.Enabled:= True;
  PDetalle.Visible:= False;
  RVisualizacion.Enabled:= False;

  DesHabilitarBarra;

  empresa_ec.Enabled:= false;
  centro_Ec.Enabled:= false;
  numero_entrada_ec.Enabled:= false;
  fecha_ec.Enabled:= false;
  hora_ec.Enabled:= false;
  producto_ec.Enabled:= false;

  if transportista_ec.CanFocus then
      transportista_ec.SetFocus;

  peso_neto_ec.Enabled:= False;
  total_cajas_ec.Enabled:= False;
  total_palets_ec.Enabled:= False;
end;

procedure TFEntradaCampo.EditarD;
begin
  PMaestro.Enabled:= False;
  PDetalle.Visible:= True;
  RVisualizacion.Enabled:= False;

  DesHabilitarBarra;

  if sCosechero <> '' then
  begin
    if codigo_palet_e1l.CanFocus then
      codigo_palet_e1l.SetFocus;
  end
  else
  begin
    if cosechero_e1l.CanFocus then
      cosechero_e1l.SetFocus
    else
    if codigo_palet_e1l.CanFocus then
      codigo_palet_e1l.SetFocus;
  end;

  if QEntradaCampoC.fieldByName('pesar_palets_ec').AsInteger = 1 then
  begin
    bruto_e1l.Enabled:= True;
  end
  else
  begin
    bruto_e1l.Enabled:= False;
  end;

  categoria_e1l.ItemIndex:= iCategoria;

end;

procedure TFEntradaCampo.FiltrarOrdenes;
var
  FFIltro: TFFiltro;
begin
  FFIltro:= TFFiltro.Create( self );

  try
    if FFiltro.ShowModal = mrOk then
    begin
      sFiltro := FFiltro.GetFiltro;
      with QEntradaCampoC do
      begin
        sWhereCab:= sFiltro;
        try
          DisableControls;
          AbrirMaestroDetalle;
        finally
          EnableControls;
        end;
      end;
    end;
  finally
    FreeAndNil( FFiltro );
  end;
end;

procedure TFEntradaCampo.BorrarEntradaActual( const APreguntar: Boolean );
begin
  //Borrar detalle
  if ( not APreguntar ) or ( Application.MessageBox(PCHAR( 'Seguro que quiere borrar la entrada actual. ' ),
                            'BORRAR ENTRADA', MB_YESNO ) = IDYES ) then
  begin
    if not DEntradaCampo.Database.InTransaction then
    begin
      DEntradaCampo.Database.StartTransaction;
      try
        //Borrar detalle resumen
        with DEntradaCampo.QBorrarDetalle do
        begin
          ParamByName('empresa').AsString:= empresa_ec.Text;
          ParamByName('centro').AsString:= centro_ec.Text;
          ParamByName('entrada').AsInteger:= StrToIntDef( numero_entrada_ec.Text, 0);
          ParamByName('fecha').AsDateTime:= StrToDateDef( fecha_ec.Text, 0 );
          ExecSQL;
        end;
        //Borrar detalle palets
        with DEntradaCampo.QBorrarPalets do
        begin
          ParamByName('empresa').AsString:= empresa_ec.Text;
          ParamByName('centro').AsString:= centro_ec.Text;
          ParamByName('entrada').AsInteger:= StrToIntDef( numero_entrada_ec.Text, 0);
          ParamByName('fecha').AsDateTime:= StrToDateDef( fecha_ec.Text, 0 );
          ExecSQL;
        end;
        //Borrar cabecera activa
        QEntradaCampoC.Delete;
        DEntradaCampo.Database.Commit;
      except
        DEntradaCampo.Database.Rollback;
        Raise;
      end;
    end
    else
    begin
      ShowMessage('Lo sentimos, pero en este momento no podemos borrar la entrada seleccionada.');
    end;
  end;
end;

procedure TFEntradaCampo.BorrarDetalleActual( const APreguntar: Boolean );
begin
  if ( not APreguntar  ) or ( Application.MessageBox(PCHAR( 'Seguro que quiere borrar la linea activa.' ),
                            'BORRAR PALET ENTRADA', MB_YESNO ) = IDYES ) then
  begin
    //Borrar detalle activo
    QEntradaCampoL.Delete;
  end;
end;

procedure TFEntradaCampo.btnPrimeroClick(Sender: TObject);
begin
  QEntradaCampoC.First;
  ActualizarEstado( kVisualizar );
end;

procedure TFEntradaCampo.btnUltimoClick(Sender: TObject);
begin
  QEntradaCampoC.Last;
  ActualizarEstado( kVisualizar );
end;

procedure TFEntradaCampo.btnAnteriorClick(Sender: TObject);
begin
  QEntradaCampoC.Prior;
  ActualizarEstado( kVisualizar );
end;

procedure TFEntradaCampo.btnProximoClick(Sender: TObject);
begin
  QEntradaCampoC.Next;
  ActualizarEstado( kVisualizar );
end;

procedure TFEntradaCampo.btnAceptarClick(Sender: TObject);
begin

  //14/01/2019 - Desde 01/01/2019 no se puede dar entradas en la 080
  if empresa_ec.Text = '080' then
  begin
    ShowMessage('ATENCION! No se puede crear entradas en la empresa ''080''.');
    Exit;
  end;


  if QEntradaCampoC.State in [dsInsert, dsEdit] then
  begin
    QEntradaCampoC.Post;
    ActualizarEstado( kVisualizar );
    if EstadoAnterior = kNuevaCabecera then
    begin
      AltaDetalle;
    end
    else
    begin
      ResumenDetalle;
    end;
  end
  else
  if QEntradaCampoL.State in [dsInsert, dsEdit] then
  begin
    QEntradaCampoL.Post;
    ActualizarEstado( kVisualizar );
    if EstadoAnterior = kNuevoDetalle then
    begin
      AltaDetalle;
    end
    else
    begin
      ResumenDetalle;
    end;
  end;
end;

procedure TFEntradaCampo.btnCancelarClick(Sender: TObject);
begin
  bEscape:= True;
  if QEntradaCampoC.State in [dsInsert, dsEdit] then
  begin
    QEntradaCampoC.Cancel;
  end
  else
  begin
    if QEntradaCampoL.State in [dsInsert, dsEdit] then
    begin
      QEntradaCampoL.Cancel;
      if bActualizarDetalle then
      begin
        ResumenDetalle;
      end;
    end;
  end;
  ActualizarEstado( kVisualizar );
  bActualizarDetalle:= False;
end;

procedure TFEntradaCampo.btnCerrarClick(Sender: TObject);
begin
  Close;
end;

procedure TFEntradaCampo.PesarPaletsStatus;
begin
  if ( Length( empresa_ec.Text ) = 3 ) and ( ( QEntradaCampoC.State = dsInsert ) or ( QEntradaCampoC.State = dsEdit ) ) then
  begin
    if empresa_ec.Text = '050' then
    begin
      pesar_palets_ec.Checked:= False;
      QEntradaCampoC.FieldByName('pesar_palets_ec').AsInteger:= 0;
    end
    else
    begin
      if producto_ec.Text = 'H' then
      begin
        pesar_palets_ec.Checked:= False;
        QEntradaCampoC.FieldByName('pesar_palets_ec').AsInteger:= 0;
      end
      else
      begin
        pesar_palets_ec.Checked:= True;
        QEntradaCampoC.FieldByName('pesar_palets_ec').AsInteger:= 1;
      end;
    end;
  end;
end;

procedure TFEntradaCampo.empresa_ecChange(Sender: TObject);
begin
  nomEmpresa.Caption:= DDescripciones.desEmpresa( empresa_ec.Text );
  nomCentro.Caption:= DDescripciones.desCentro( empresa_ec.Text, centro_ec.Text );
  nomTransporte.Caption:= DDescripciones.desTransporte( empresa_ec.Text, transportista_ec.Text );
  nomProducto.Caption:= DDescripciones.desProductoAlta( producto_ec.Text );
  PutContadorAutomatico;

  if ( QEntradaCampoC.State = dsInsert ) then
    PesarPaletsStatus;
end;

procedure TFEntradaCampo.centro_EcChange(Sender: TObject);
begin
  nomCentro.Caption:= DDescripciones.desCentro( empresa_ec.Text, centro_ec.Text );
  PutContadorAutomatico;
end;

procedure TFEntradaCampo.numero_entrada_ecChange(Sender: TObject);
begin
  iContador:= StrToIntDef( numero_entrada_ec.Text, -1 );
end;

procedure TFEntradaCampo.PutContadorAutomatico;
begin
  if ( DSMaestro.State in [dsInsert, dsEdit] ) and bActualizarContador then
  begin
    iContadorAutomatico:= DEntradaCampo.GetNumeroEntrada( empresa_ec.Text, centro_ec.Text, False );
    if iContadorAutomatico <> -1 then
    begin
      numero_entrada_ec.Text:= IntToStr( iContadorAutomatico );
      QEntradaCampoC.FieldByName('numero_entrada_ec').AsInteger:= iContadorAutomatico;
    end;
  end;
end;

procedure TFEntradaCampo.producto_ecChange(Sender: TObject);
begin
  nomProducto.Caption:= DDescripciones.desProductoAlta( producto_ec.Text );
  PesarPaletsStatus;
end;

procedure TFEntradaCampo.transportista_ecChange(Sender: TObject);
begin
  nomTransporte.Caption:= DDescripciones.desTransporte( empresa_ec.Text, transportista_ec.Text );
end;

procedure TFEntradaCampo.cosechero_e1lChange(Sender: TObject);
begin
  nomCosechero.Caption:= DDescripciones.desCosechero( empresa_ec.Text, cosechero_e1l.Text );
end;

procedure TFEntradaCampo.plantacion_e1lChange(Sender: TObject);
begin
  nomPlantacion.Caption:= DDescripciones.desPlantacionEx( empresa_ec.Text, producto_ec.Text,
    cosechero_e1l.Text, plantacion_e1l.Text, fecha_ec.Text );
end;

procedure TFEntradaCampo.formato_e1lChange(Sender: TObject);
var
  sAux: string;
  rPesoPalet, rPesoCaja: Real;
  iCajasPalet: integer;
begin
  if ObtenerTaraPalet( empresa_ec.Text, centro_ec.Text, producto_ec.Text, formato_e1l.Text, rPesoPalet, rPesoCaja, iCajasPalet, sAux ) then
  begin
    stFormato.Caption:= sAux;
    total_cajas_e1l.Text:= IntToStr( iCajasPalet );
  end
  else
  begin
    stFormato.Caption:= '';
  end;
end;

procedure TFEntradaCampo.QEntradaCampoLAfterEdit(DataSet: TDataSet);
begin
  nomCosechero.Caption:= DDescripciones.desCosechero( empresa_ec.Text, cosechero_e1l.Text );
  nomPlantacion.Caption:= DDescripciones.desPlantacionEx( empresa_ec.Text, producto_ec.Text,
    cosechero_e1l.Text, plantacion_e1l.Text, fecha_ec.Text );
  stFormato.Caption:= DDescripciones.desFormato( empresa_ec.Text, centro_ec.Text, producto_ec.Text, formato_e1l.Text );
end;

procedure TFEntradaCampo.btnEmpresaClick(Sender: TObject);
var
  sAux: String;
begin
  sAux:= empresa_ec.Text;
  if SeleccionaEmpresa( self, empresa_ec, sAux ) then
    empresa_ec.Text:= sAux;
end;

procedure TFEntradaCampo.btnCentroClick(Sender: TObject);
var
  sAux: String;
begin
  sAux:= centro_ec.Text;
  if SeleccionaCentro( self, centro_Ec, empresa_ec.Text, sAux ) then
    empresa_ec.Text:= sAux;
end;

procedure TFEntradaCampo.btnProductoClick(Sender: TObject);
var
  sAux: String;
begin
  sAux:= producto_ec.Text;
  if SeleccionaProducto( self, producto_ec, empresa_ec.Text, sAux ) then
    producto_ec.Text:= sAux;
end;

procedure TFEntradaCampo.btnTransportistasClick(Sender: TObject);
var
  sAux: String;
begin
  sAux:= transportista_ec.Text;
  if UFTransportistas.SeleccionaTransportista( self, transportista_ec, empresa_ec.Text, sAux ) then
    transportista_ec.Text:= sAux;
end;

procedure TFEntradaCampo.btnFechaClick(Sender: TObject);
var
  sAux: String;
begin
  sAux:= fecha_ec.Text;
  if PonFecha( self, fecha_ec, fecha_ec.Text, sAux ) then
    fecha_ec.Text:= sAux;
end;

procedure TFEntradaCampo.btnCosecheroClick(Sender: TObject);
var
  sAux: String;
begin
  sAux:= cosechero_e1l.Text;
  if SeleccionaCosechero( self, cosechero_e1l, empresa_ec.Text, sAux ) then
    cosechero_e1l.Text:= sAux;
end;

procedure TFEntradaCampo.btnPlantacionClick(Sender: TObject);
var
  sAux: String;
begin
  sAux:= plantacion_e1l.Text;
  if SeleccionaPlantacion( self, plantacion_e1l, empresa_ec.Text, cosechero_e1l.Text, producto_ec.Text, fecha_ec.Text, sAux ) then
    plantacion_e1l.Text:= sAux;
end;

procedure TFEntradaCampo.btnFormatoClick(Sender: TObject);
var
  sAux: String;
begin
  sAux:= formato_e1l.Text;
  if SeleccionaFormato( self, formato_e1l, empresa_ec.Text, centro_Ec.Text, producto_ec.Text, sAux ) then
    formato_e1l.Text:= sAux;
end;

procedure TFEntradaCampo.btnAltaClick(Sender: TObject);
begin
  (*BORRAR Probar redondeo
  showmessage( '1.51 ->' + FormatFloat('#,##0.00', bRoundTo( 1.51, 0 ) ) + #13 + #10 +
               '1.49 ->' + FormatFloat('#,##0.00', bRoundTo( 1.49, 0 ) ) );
  Exit;
  *)
  QEntradaCampoC.Insert;
  sTransportista:= '';
  ActualizarEstado( kNuevaCabecera );
  bActualizarDetalle:= True;
end;

procedure TFEntradaCampo.btnEditarCClick(Sender: TObject);
begin
  if TieneEscandallos then
  begin
    ShowMessage('No se puede modificar una entrada que tiene asociado un escandallo.');
    Exit;
  end;
  
  QEntradaCampoC.Edit;
  sTransportista:= transportista_ec.Text;
  ActualizarEstado( kEditarCabecera );
end;

procedure TFEntradaCampo.btnBorrarClick(Sender: TObject);
begin
  if TieneEscandallos then
  begin
    ShowMessage('No se puede modificar una entrada que tiene asociado un escandallo.');
    Exit;
  end;
  
  BorrarEntradaActual( true );
  ActualizarEstado( kVisualizar );
end;

procedure TFEntradaCampo.btnLocalizarClick(Sender: TObject);
begin
  FiltrarOrdenes;
  ActualizarEstado( kVisualizar );
end;

procedure TFEntradaCampo.AltaDetalle;
begin
  QEntradaCampoL.Insert;
  ActualizarEstado( kNuevoDetalle );
end;

procedure TFEntradaCampo.btnAltaDClick(Sender: TObject);
begin
  if TieneEscandallos then
  begin
    ShowMessage('No se puede modificar una entrada que tiene asociado un escandallo.');
    Exit;
  end;

  //if ObtenerTara then
  //begin
  (*
    sCosechero:= QEntradaCampoL.FieldByName('cosechero_e1l').AsString;
    sPlantacion:= QEntradaCampoL.FieldByName('plantacion_e1l').AsString;
    sFormato:= QEntradaCampoL.FieldByName('formato_e1l').AsString;
    iCajas:= QEntradaCampoL.FieldByName('total_cajas_e1l').AsInteger;
    iCategoria:= QEntradaCampoL.FieldByName('categoria_e1l').AsInteger;
    iCalibre:= QEntradaCampoL.FieldByName('calibre_e1l').AsInteger;
  *)
    sCosechero:= '';
    sPlantacion:= '';
    sFormato:= '';
    iCajas:= 0;
    iCategoria:= 1;
    iCalibre:= 0;

    bActualizarDetalle:= True;
    AltaDetalle;
  //end;
end;

procedure TFEntradaCampo.btnEditarDClick(Sender: TObject);
begin
  if TieneEscandallos then
  begin
    ShowMessage('No se puede modificar una entrada que tiene asociado un escandallo.');
    Exit;
  end;
  
  //if ObtenerTara then
  //begin
    QEntradaCampoL.Edit;
    cosechero_e1lChange( cosechero_e1l );
    plantacion_e1lChange( plantacion_e1l );

    cosechero_e1l.Enabled:= False;
    plantacion_e1l.Enabled:= False;

    categoria_e1l.ItemIndex:= QEntradaCampoL.FieldByName('categoria_e1l').AsInteger;
    iCategoria:= categoria_e1l.ItemIndex;
    calibre_e1l.ItemIndex:= QEntradaCampoL.FieldByName('calibre_e1l').AsInteger;

    ActualizarEstado( kEditarDetalle );
  //end;
end;

procedure TFEntradaCampo.btnBorrarDClick(Sender: TObject);
begin
  if TieneEscandallos then
  begin
    ShowMessage('No se puede modificar una entrada que tiene asociado un escandallo.');
    Exit;
  end;
  
  BorrarDetalleActual( True );
  ActualizarEstado( kVisualizar );
end;

procedure TFEntradaCampo.QEntradaCampoCAfterInsert(DataSet: TDataSet);
begin
  bActualizarContador:= False;

  empresa_ec.Text:= sgEmpresa;
  centro_ec.Text:= sgCentro;
  fecha_ec.Text:= DateToStr( Date );
  hora_ec.Text:= GetHoraActual;


  QEntradaCampoC.FieldByName('empresa_ec').AsString:= sgEmpresa;
  QEntradaCampoC.FieldByName('centro_ec').AsString:= sgCentro;
  QEntradaCampoC.FieldByName('fecha_ec').AsDateTime:= Date;
  QEntradaCampoC.FieldByName('hora_ec').AsString:= hora_ec.Text;


  PesarPaletsStatus;

  iContadorAutomatico:= DEntradaCampo.GetNumeroEntrada( sgEmpresa, sgCentro, false );
  numero_entrada_ec.Text:= IntToStr( iContadorAutomatico );
  QEntradaCampoC.FieldByName('numero_entrada_ec').AsInteger:= iContadorAutomatico;

  bActualizarContador:= True;

  sCosechero:= '';
  sPlantacion:= '';
  sFormato:= '';
  iCajas:= 0;
  iCategoria:= 0;
  iCalibre:= 0;
end;

function  TFEntradaCampo.ExisteTaraPalet( const AEmpresa, ACentro, AProducto, AFormato: string; var VMsg: string ): boolean;
var
  rPesoPalet, rPesoCaja: real;
  rCajasPalet: Integer;
begin
  Result:= ObtenerTaraPalet( AEmpresa, ACentro, AProducto, AFormato, rPesoPalet, rPesoCaja, rCajasPalet, VMsg);
end;

function  TFEntradaCampo.ObtenerTaraPalet( const AEmpresa, ACentro, AProducto, AFormato: string;
                                           var VPesoPalet, VPesoCaja: real; var VCajasPalet: Integer; var VMsg: string ): boolean;
begin
  result:= False;
  VPesoPalet:= 0;
  VPesoCaja:= 0;
  VCajasPalet:= 0;

  //Comprobar que la tara del camion, palet y caja, y cantidad cajas palet este grabado.
  with DEntradaCampo.QPesos do
  begin
    ParamByName('empresa').AsString:= AEmpresa;
    ParamByName('centro').AsString:= ACentro;
    ParamByName('producto').AsString:= AProducto;
    ParamByName('formato').AsString:= AFormato;
    Open;
    if IsEmpty then
    begin
      VMsg:= 'Falta grabar los pesos de los palets y cajas en el mantenimiento de pesos.';
    end
    else
    begin
      if ( FieldByName('peso_palet').AsFloat = 0 ) or
         ( FieldByName('peso_caja').AsFloat = 0 ) then
      begin
        VMsg:= 'Falta grabar los pesos de los palets y cajas en el mantenimiento de pesos.';
      end
      else
      begin
        if ( FieldByName('cajas').AsFloat = 0 ) then
        begin
          VMsg:= 'Falta grabar la cantidad de cajas por palet en el mantenimiento de pesos.';
        end
        else
        begin
          Result:= True;
          VMsg:= FieldByName('descripcion').AsString;
          VPesoPalet:= FieldByName('peso_palet').AsFloat;
          VPesoCaja:= FieldByName('peso_caja').AsFloat;
          VCajasPalet:= FieldByName('cajas').AsInteger;
        end;
      end;
    end;
    Close;
  end;
end;


function  TFEntradaCampo.ExisteTaraCamion( const AEmpresa, ATransportista: string; var VMsg: string ): boolean;
var
  rPesoCamion: real;
begin
  Result:= ObtenerTaraCamion( AEmpresa, ATransportista, rPesoCamion, VMsg );
end;

function TFEntradaCampo.ObtenerTaraCamion( const AEmpresa, ATransportista: string;
                                           var VPesoCamion: real; var VMsg: string ): boolean;
begin
  Result:= False;
  with DEntradaCampo.QTaraCamion do
  begin
    ParamByName('camion').AsString:= ATransportista;
    Open;
    if IsEmpty then
    begin
      VMsg:= 'Falta grabar la tara del camión en el mantenimiento de transportistas.';
    end
    else
    begin
      if ( FieldByName('tara').AsFloat = 0 ) then
      begin
        VMsg:= 'La tara del camión en el mantenimiento de transportistas no puede ser 0.';
      end
      else
      begin
        result:= True;
        VMsg:= 'OK';
        VPesoCamion:= FieldByName('tara').AsFloat;
      end;
    end;
    Close;
  end;

end;

procedure TFEntradaCampo.QEntradaCampoCBeforePost(DataSet: TDataSet);
var
  sAux: string;
begin
  if not bPost then
    Exit;
    
  //Empresa de obligada insercion
  if Trim( empresa_ec.Text ) = '' then
  begin
    ShowMessage('El código de la empresa es de obligada inserción.');
    empresa_ec.SetFocus;
    Abort;
  end;
  if nomEmpresa.Caption = '' then
  begin
    ShowMessage('El código de la empresa es incorrecto.');
    empresa_ec.SetFocus;
    Abort;
  end;
  //Centro de obligada insercion
  if Trim( centro_ec.Text ) = '' then
  begin
    ShowMessage('El código del centro es de obligada inserción.');
    centro_ec.SetFocus;
    Abort;
  end;
  if nomCentro.Caption = '' then
  begin
    ShowMessage('El código del centro es incorrecto.');
    centro_Ec.SetFocus;
    Abort;
  end;
  //Fecha de obligada insercion
  if Trim( fecha_ec.Text ) = '' then
  begin
    ShowMessage('La fecha de la entrada es de obligada inserción.');
    fecha_ec.SetFocus;
    Abort;
  end;
  //Numero de entrada de obligada insercion
  if Trim( centro_ec.Text ) = '' then
  begin
    ShowMessage('El número de la entrada es de obligada inserción.');
    numero_entrada_ec.SetFocus;
    Abort;
  end;
  //El producto de obligada insercion
  if Trim( producto_ec.Text ) = '' then
  begin
    ShowMessage('El código del producto es de obligada inserción.');
    producto_ec.SetFocus;
    Abort;
  end;
  if nomProducto.Caption = '' then
  begin
    if not DDescripciones.EsProductoAlta(producto_ec.Text) then
      ShowMessage(' ATENCIÓN: Error al grabar la entrada, el producto está dado de BAJA. ')
    else
      ShowMessage('El código del producto es incorrecto.');
    producto_ec.SetFocus;
    Abort;
  end;
  //El transportista es de obligada insercion
  if Trim( transportista_ec.Text ) = '' then
  begin
    ShowMessage('El código del transportsita es de obligada inserción.');
    transportista_ec.SetFocus;
    Abort;
  end;
  if nomTransporte.Caption = '' then
  begin
    ShowMessage('El código del transportista es incorrecto.');
    transportista_ec.SetFocus;
    Abort;
  end;

  if not ExisteTaraCamion( empresa_ec.Text, transportista_ec.Text, sAux ) then
  begin
    ShowMessage( sAux );
    Abort;
  end;

  //Peso bruto
  if ( trim( peso_bruto_ec.Text ) = '' ) then
  begin
    if not pesar_palets_ec.Checked then
    begin
      ShowMessage('El peso bruto de la entrada es necesario.');
      peso_bruto_ec.SetFocus;
      Abort;
    end
    else
    begin
      peso_bruto_ec.Text:= '0';
      QEntradaCampoC.FieldByName('peso_bruto_ec').AsFloat:= 0;
    end;
  end;

  //Valores por defecto
  if trim( peso_neto_ec.Text ) = '' then
  begin
    peso_neto_ec.Text:= '0';
    QEntradaCampoC.FieldByName('peso_neto_ec').AsInteger:= 0;
  end;
  if trim( total_cajas_ec.Text ) = '' then
  begin
    total_cajas_ec.Text:= '0';
    QEntradaCampoC.FieldByName('total_cajas_ec').AsInteger:= 0;
  end;
  if trim( total_palets_ec.Text ) = '' then
  begin
    total_palets_ec.Text:= '0';
    QEntradaCampoC.FieldByName('total_palets_ec').AsInteger:= 0;
  end;

  //Si el numero de entrada lo hemos puesto a mano lo aceptamos,
  //sino lo volvemos a calcular por si alguien lo uso mientras editabamos la entrada
  if ( iContador = iContadorAutomatico ) and ( QEntradaCampoC.State = dsInsert ) then
  begin
    iContadorAutomatico:= DEntradaCampo.GetNumeroEntrada( empresa_ec.Text, centro_ec.Text, True );
    numero_entrada_ec.Text:= IntToStr( iContadorAutomatico );
    QEntradaCampoC.FieldByName('numero_entrada_ec').AsInteger:= iContadorAutomatico;
  end;
end;

procedure TFEntradaCampo.QEntradaCampoCAfterPost(DataSet: TDataSet);
begin
  if sTransportista <> '' then
  begin
    if sTransportista <> transportista_ec.Text then
    begin
      with DEntradaCampo.QCambiarTransportista do
      begin
        ParamByName('empresa').AsString:= QEntradaCampoC.fieldByName('empresa_ec').AsString;
        ParamByName('centro').AsString:= QEntradaCampoC.fieldByName('centro_ec').AsString;
        ParamByName('entrada').AsInteger:= QEntradaCampoC.fieldByName('numero_entrada_ec').AsInteger;
        ParamByName('fecha').AsDateTime:= QEntradaCampoC.fieldByName('fecha_ec').AsDateTime;
        ParamByName('transportista').AsString:= transportista_ec.Text;
        ExecSQL;
      end;
    end;
  end;
end;

procedure TFEntradaCampo.QEntradaCampoLBeforePost(DataSet: TDataSet);
var
  sAux: string;
begin
  if not bPost then
    Exit;
  //Cosechero
  if Trim( cosechero_e1l.Text ) = '' then
  begin
    ShowMessage('Falta el codigo del cosechero');
    cosechero_e1l.SetFocus;
    Abort;
  end;
  if nomCosechero.Caption = '' then
  begin
    ShowMessage('Cosechero incorrecto');
    cosechero_e1l.SetFocus;
    Abort;
  end;

  //Plantacion
  if Trim( plantacion_e1l.Text ) = '' then
  begin
    ShowMessage('Falta el codigo de la plantación');
    plantacion_e1l.SetFocus;
    Abort;
  end;
  if nomPlantacion.Caption = '' then
  begin
    ShowMessage('Plantación incorrecta');
    plantacion_e1l.SetFocus;
    Abort;
  end;

  //Formato
  if Trim( formato_e1l.Text ) = '' then
  begin
    ShowMessage('Falta el codigo del formato');
    formato_e1l.SetFocus;
    Abort;
  end;
  if stFormato.Caption = '' then
  begin
    ShowMessage('Formato incorrecta');
    formato_e1l.SetFocus;
    Abort;
  end;

  if not ExisteTaraPalet( empresa_ec.Text, centro_Ec.Text, producto_ec.Text, formato_e1l.Text, sAux ) then
  begin
    ShowMessage( sAux );
    Abort;
  end;

  //Cajas
  if Trim( total_cajas_e1l.Text ) = '' then
  begin
    ShowMessage('Falta el numero de cajas del palet');
    total_cajas_e1l.SetFocus;
    Abort;
  end;

  //Codigo EAN13 del palet
  if Trim( codigo_palet_e1l.Text ) = '' then
  begin
    ShowMessage('Falta el código EAN13 del palet');
    codigo_palet_e1l.SetFocus;
    Abort;
  end;
  if Length( codigo_palet_e1l.Text ) <> 13 then
  begin
    ShowMessage('El codigo EAN13 del palet debe tener 13 dígitos');
    codigo_palet_e1l.SetFocus;
    Abort;
  end;

  if QEntradaCampoL.State = dsInsert then
  begin
    QEntradaCampoL.FieldByName('empresa_e1l').AsString:= QEntradaCampoC.FieldByName('empresa_ec').AsString;
    QEntradaCampoL.FieldByName('centro_e1l').AsString:= QEntradaCampoC.FieldByName('centro_ec').AsString;
    QEntradaCampoL.FieldByName('numero_entrada_e1l').AsInteger:= QEntradaCampoC.FieldByName('numero_entrada_ec').AsInteger;
    QEntradaCampoL.FieldByName('fecha_e1l').AsDateTime:= QEntradaCampoC.FieldByName('fecha_ec').AsDateTime;
    QEntradaCampoL.FieldByName('producto_e1l').AsString:= QEntradaCampoC.FieldByName('producto_ec').AsString;
    QEntradaCampoL.FieldByName('transportista_e1l').AsInteger:= QEntradaCampoC.FieldByName('transportista_ec').AsInteger;


    QEntradaCampoL.FieldByName('hora_e1l').AsString:= GetHoraActual;
    QEntradaCampoL.FieldByName('verde_e1l').AsInteger:= 0;
  end;

  QEntradaCampoL.FieldByName('ano_sem_planta_e1l').AsString:=
      DDescripciones.CalcularAnoSemana(QEntradaCampoL.FieldByName('empresa_e1l').AsString,
                      QEntradaCampoL.FieldByName('producto_e1l').AsString,
                      QEntradaCampoL.FieldByName('cosechero_e1l').AsString,
                      QEntradaCampoL.FieldByName('plantacion_e1l').AsString,
                      QEntradaCampoL.FieldByName('fecha_e1l').AsString);

  sCosechero:= QEntradaCampoL.FieldByName('cosechero_e1l').AsString;
  sPlantacion:= QEntradaCampoL.FieldByName('plantacion_e1l').AsString;
  sFormato:= QEntradaCampoL.FieldByName('formato_e1l').AsString;
  iCajas:= QEntradaCampoL.FieldByName('total_cajas_e1l').AsInteger;

  iCategoria:= categoria_e1l.ItemIndex;
  iCalibre:= calibre_e1l.ItemIndex;
  QEntradaCampoL.FieldByName('categoria_e1l').AsInteger:= iCategoria;
  QEntradaCampoL.FieldByName('calibre_e1l').AsInteger:= iCalibre;

  //destarar
  //Tara palets y cajas
  if QEntradaCampoC.fieldByName('pesar_palets_ec').AsInteger = 1 then
  begin
    QEntradaCampoL.FieldByName('kilos_e1l').AsFloat:=
      QEntradaCampoL.FieldByName('bruto_e1l').AsFloat -
      TaraPaletYCajas( QEntradaCampoC.fieldByName('empresa_ec').AsString,
                       QEntradaCampoC.fieldByName('centro_ec').AsString,
                       QEntradaCampoC.fieldByName('producto_ec').AsString,
                       QEntradaCampoL.fieldByName('formato_e1l').AsString,
                       QEntradaCampoC.fieldByName('fecha_ec').AsDateTime,
                       QEntradaCampoC.fieldByName('numero_entrada_ec').AsInteger,
                       QEntradaCampoL.fieldByName('total_cajas_e1l').AsInteger );

    if QEntradaCampoL.FieldByName('kilos_e1l').AsFloat < 0 then
    begin
      QEntradaCampoL.FieldByName('kilos_e1l').AsFloat:= 0;
    end;
  end;
end;

procedure TFEntradaCampo.QEntradaCampoLAfterCancel(DataSet: TDataSet);
begin
  sCosechero:= '';
  sPlantacion:= '';
  sFormato:= '';
  iCajas:= 0;
  iCategoria:= 0;
  iCalibre:= 0;
end;

procedure TFEntradaCampo.QEntradaCampoLAfterInsert(DataSet: TDataSet);
begin
  if sCosechero <> '' then
  begin
    cosechero_e1l.Text:= sCosechero;
    plantacion_e1l.Text:= sPlantacion;
    cosechero_e1l.Enabled:= False;
    plantacion_e1l.Enabled:= False;
    formato_e1l.Text:= sFormato;
    QEntradaCampoL.FieldByName('cosechero_e1l').AsString:= sCosechero;
    QEntradaCampoL.FieldByName('plantacion_e1l').AsString:= sPlantacion;
    QEntradaCampoL.FieldByName('formato_e1l').AsString:= sFormato;
    QEntradaCampoL.FieldByName('total_cajas_e1l').AsInteger:= iCajas;
    categoria_e1l.ItemIndex:= iCategoria;
    calibre_e1l.ItemIndex:= iCalibre;
  end
  else
  begin
    cosechero_e1l.Enabled:= True;
    plantacion_e1l.Enabled:= True;
    categoria_e1l.ItemIndex:= 1;
    calibre_e1l.ItemIndex:= 0;
  end;
end;

procedure TFEntradaCampo.ActualizarCabecera( const APalets, ACajas: integer;
                                             const ABruto, ANeto: Real );
begin
  with DEntradaCampo.QActualizarCabecera do
  begin
    ParamByName('empresa').AsString:= QEntradaCampoC.fieldByName('empresa_ec').AsString;
    ParamByName('centro').AsString:= QEntradaCampoC.fieldByName('centro_ec').AsString;
    ParamByName('entrada').AsInteger:= QEntradaCampoC.fieldByName('numero_entrada_ec').AsInteger;
    ParamByName('fecha').AsDateTime:= QEntradaCampoC.fieldByName('fecha_ec').AsDateTime;
    ParamByName('total_cajas').AsInteger:= ACajas;
    ParamByName('total_palets').AsInteger:= APalets;
    ParamByName('peso_bruto').AsFloat:= ABruto;
    ParamByName('peso_neto').AsFloat:= ANeto;
    ExecSQL;
  end;
end;

procedure TFEntradaCampo.ActualizarDetalle( const ANetoCaja: real );
begin
  with QEntradaCampoL do
  begin
    First;
    while not Eof do
    begin
      Edit;
      try
       FieldByName('kilos_e1l').AsFloat:= bRoundTo( FieldByName('total_cajas_e1l').AsFloat * ANetoCaja, 2 );
       FieldByName('bruto_e1l').AsFloat:= FieldByName('kilos_e1l').AsFloat +
         TaraPaletYCajas( QEntradaCampoC.fieldByName('empresa_ec').AsString,
                       QEntradaCampoC.fieldByName('centro_ec').AsString,
                       QEntradaCampoC.fieldByName('producto_ec').AsString,
                       QEntradaCampoL.fieldByName('formato_e1l').AsString,
                       QEntradaCampoC.fieldByName('fecha_ec').AsDateTime,
                       QEntradaCampoC.fieldByName('numero_entrada_ec').AsInteger,
                       QEntradaCampoL.fieldByName('total_cajas_e1l').AsInteger );

        bPost:= False;
        Post;
        bPost:= True;
      except
        Cancel;
        bPost:= True;
      end;
      Next;
    end;
    First;
  end;
end;

procedure TFEntradaCampo.DestararCamion( const ASectores: string );
var
  rTaraCamion, rTaraPalets, rTaraPalet, rTaraCaja: Real;
  iCajasPalet: Integer;
  bFlag: boolean;

  iNumPalets, iNumCajas: integer;
  rTaraTotal, rNetoTotal, rKilosCaja, rAcumKilos: real;
  sAux, sSectores: string;
begin
  sSectores:= ASectores;
  with DEntradaCampo do
  begin
    TResumenDetalle.Open;
    QResumenDetalle.ParamByName('empresa').AsString:= QEntradaCampoC.fieldByName('empresa_ec').AsString;
    QResumenDetalle.ParamByName('centro').AsString:= QEntradaCampoC.fieldByName('centro_ec').AsString;
    QResumenDetalle.ParamByName('entrada').AsInteger:= QEntradaCampoC.fieldByName('numero_entrada_ec').AsInteger;
    QResumenDetalle.ParamByName('fecha').AsDateTime:= QEntradaCampoC.fieldByName('fecha_ec').AsDateTime;
    QResumenDetalle.Open;
    if not QResumenDetalle.IsEmpty then
    begin
      //Tara camion
      ObtenerTaraCamion( empresa_ec.Text, transportista_ec.Text, rTaraCamion, sAux );

      //Tara palets
      rTaraPalets:= 0;
      iNumCajas:= 0;
      iNumPalets:= 0;
      QPalets.ParamByName('empresa').AsString:= QEntradaCampoC.fieldByName('empresa_ec').AsString;
      QPalets.ParamByName('centro').AsString:= QEntradaCampoC.fieldByName('centro_ec').AsString;
      QPalets.ParamByName('entrada').AsInteger:= QEntradaCampoC.fieldByName('numero_entrada_ec').AsInteger;
      QPalets.ParamByName('fecha').AsDateTime:= QEntradaCampoC.fieldByName('fecha_ec').AsDateTime;
      QPalets.Open;
      while not QPalets.Eof do
      begin
        iNumCajas:= iNumCajas + QPalets.FieldByName('total_cajas_e1l').AsInteger;
        iNumPalets:= iNumPalets + QPalets.FieldByName('total_palets_e1l').AsInteger;
        if not ObtenerTaraPalet( empresa_ec.Text, centro_ec.Text, producto_ec.Text,
                          QPalets.FieldByName('formato_e1l').AsString,
                          rTaraPalet, rTaraCaja, iCajasPalet, sAux ) then
        begin
          ShowMessage( 'Error al calcular la tara de los palets. ' + #13 + #10 + sAux );
        end;
        rTaraPalets:= rTaraPalets + ( QPalets.FieldByName('total_palets_e1l').AsInteger * rTaraPalet ) + ( QPalets.FieldByName('total_cajas_e1l').AsInteger * rTaraCaja );

        QPalets.NexT;
      end;
      QPalets.Close;

      //Tara total
      rTaraTotal:= rTaraCamion + rTaraPalets;
      rNetoTotal:= QEntradaCampoC.fieldByName('peso_bruto_ec').AsFloat - rTaraTotal;
      if rNetoTotal < 0 then
      begin
        ShowMessage('ERROR: El peso bruto es menor que la tara del transporte (peso camión + peso palets + peso cajas ).');
        rNetoTotal:= 0;
      end;
      ActualizarCabecera( iNumPalets, iNumCajas, QEntradaCampoC.fieldByName('peso_bruto_ec').AsFloat, rNetoTotal );

      rKilosCaja:= bRoundTo( rNetoTotal / iNumCajas, 3 );
      ActualizarDetalle( rKilosCaja );


      rAcumKilos:= 0;

      //TResumenDetalle.First;
      while not QResumenDetalle.EOF do
      begin
        TResumenDetalle.Insert;
        TResumenDetallecosechero.AsInteger:= QResumenDetalle.FieldByName('cosechero_e1l').AsInteger;
        TResumenDetalleplantacion.AsInteger:= QResumenDetalle.FieldByName('plantacion_e1l').AsInteger;
        TResumenDetalleano_sem_planta.Asstring:= QResumenDetalle.FieldByName('ano_sem_planta_e1l').Asstring;
        TResumenDetalletotal_cajas.AsInteger:= QResumenDetalle.FieldByName('total_cajas_e1l').AsInteger;
        TResumenDetalletotal_kgs.AsFloat:= bRoundTo( QResumenDetalle.FieldByName('total_cajas_e1l').AsInteger * rKilosCaja, 0 );
        rAcumKilos:= rAcumKilos + TResumenDetalletotal_kgs.AsFloat;
        try
          TResumenDetalle.Post;
        except
          on e:exception do
          begin
            TResumenDetalle.Cancel;
            sAux:= e.Message;
            sAux:= sAux+ #13 + #10 + '[Entrega incorrecta: Error al crear el detalle de la entrega - Tabla temporal]';
            QResumenDetalle.First;
            while not QResumenDetalle.Eof do
            begin
              sAux:= sAux+ #13 + #10 + '*******************************************************';
              sAux:= sAux+ #13 + #10 + '-Plantacion: ' + QResumenDetalle.FieldByname('cosechero_e1l').AsString +
                                       '-' + QResumenDetalle.FieldByname('plantacion_e1l').AsString +
                                       '-' + QResumenDetalle.FieldByname('ano_sem_planta_e1l').AsString +  #13 + #10 +
                                       '-Palets: ' + QResumenDetalle.FieldByname('total_palets_e1l').AsString +
                                      ' -Cajas: ' + QResumenDetalle.FieldByname('total_cajas_e1l').AsString;

              QResumenDetalle.Next;
            end;
            sAux:= sAux+ #13 + #10 + '*******************************************************';
            sAux:= sAux+ #13 + #10 + '* POR FAVOR CIERRE Y VUELVA A ABRIR EL PROGRAMA';
            sAux:= sAux+ #13 + #10 + '* BORRE UN PALET DE LA ENTRADA Y VUELVA A GRABARLO';
            sAux:= sAux+ #13 + #10 + '* SI PERSISTE EL ERROR LLAME A INFORMATICA';
            sAux:= sAux+ #13 + #10 + '*******************************************************';
            raise exception.Create( sAux );
          end;
        end;
        QResumenDetalle.Next;
      end;


      if rAcumKilos <> rNetoTotal then
      begin
        TResumenDetalle.Edit;
        TResumenDetalletotal_kgs.AsFloat:= TResumenDetalletotal_kgs.AsFloat +
          ( rNetoTotal - rAcumKilos );
        TResumenDetalle.Post;
      end;
      TResumenDetalle.First;
      while not TResumenDetalle.Eof do
      begin
        if sSectores = '' then
        begin
          bFlag:= InputQuery('INTRODUCE SECTORES ', 'Plantación ' +
                                            TResumenDetallecosechero.AsString + '/' +
                                            TResumenDetalleplantacion.AsString +
                                            '(MAX 10 Caracteres):', sSectores);
        end
        else
        begin
          bFlag:= True;
        end;

        frf_entradas2_l.Insert;
        frf_entradas2_lempresa_e2l.AsString:= QEntradaCampoCempresa_ec.AsString;
        frf_entradas2_lcentro_e2l.AsString:= QEntradaCampoCcentro_ec.AsString;
        frf_entradas2_lnumero_entrada_e2l.AsInteger:= QEntradaCampoCnumero_entrada_ec.AsInteger;
        frf_entradas2_lfecha_e2l.AsDateTime:= QEntradaCampoCfecha_ec.AsDateTime;
        frf_entradas2_lproducto_e2l.AsString:= QEntradaCampoCproducto_ec.AsString;
        frf_entradas2_lcosechero_e2l.AsInteger:= TResumenDetallecosechero.AsInteger;
        frf_entradas2_lplantacion_e2l.AsInteger:= TResumenDetalleplantacion.AsInteger;
        frf_entradas2_lano_sem_planta_e2l.AsString:= TResumenDetalleano_sem_planta.AsString;
        frf_entradas2_ltotal_cajas_e2l.AsInteger:= TResumenDetalletotal_cajas.AsInteger;
        frf_entradas2_ltotal_kgs_e2l.AsFloat:= TResumenDetalletotal_kgs.AsFloat;

        if bFlag then
          frf_entradas2_lsectores_e2l.AsString:= sSectores;

        try
          frf_entradas2_l.Post;
        except
          on e:exception do
          begin
            frf_entradas2_l.Cancel;
            sAux:= e.Message;
            sAux:= sAux+ #13 + #10 + '[Entrega incorrecta: Error al crear el detalle de la entrega - Tabla BD]';
            TResumenDetalle.First;
            while not TResumenDetalle.Eof do
            begin
              sAux:= sAux+ #13 + #10 + '*******************************************************';
              sAux:= sAux+ #13 + #10 + '-Entrega: ' + QEntradaCampoC.FieldByname('empresa_ec').AsString +
                                       '-' + QEntradaCampoC.FieldByname('centro_ec').AsString +
                                       '-' + QEntradaCampoC.FieldByname('numero_entrada_ec').AsString +
                                       '-' + QEntradaCampoC.FieldByname('fecha_ec').AsString +
                                       '-' + QEntradaCampoC.FieldByname('producto_ec').AsString +  #13 + #10 +
                                       '-Plantacion: ' + TResumenDetalle.FieldByname('cosechero').AsString +
                                       '-' + TResumenDetalle.FieldByname('plantacion').AsString +
                                       '-' + TResumenDetalle.FieldByname('ano_sem_planta').AsString +  #13 + #10 +
                                       '-Cajas: ' + TResumenDetalle.FieldByname('total_cajas').AsString +
                                       ' -Kilos: ' + TResumenDetalle.FieldByname('total_kgs').AsString;
              TResumenDetalle.Next;
            end;
            sAux:= sAux+ #13 + #10 + '*******************************************************';
            sAux:= sAux+ #13 + #10 + '* POR FAVOR CIERRE Y VUELVA A ABRIR EL PROGRAMA';
            sAux:= sAux+ #13 + #10 + '* BORRE UN PALET DE LA ENTRADA Y VUELVA A GRABARLO';
            sAux:= sAux+ #13 + #10 + '* SI PERSISTE EL ERROR LLAME A INFORMATICA';
            sAux:= sAux+ #13 + #10 + '*******************************************************';
            raise exception.Create( sAux );
          end;
        end;

        TResumenDetalle.Next;
      end;
    end;
    TResumenDetalle.Close;
    QResumenDetalle.Close;
  end;
end;

(*
function TFEntradaCampo.TaraPaletsYCajas( const AEmpresa, ACentro: string; const AEntrega: Integer;
                                const AFecha: TDateTime; const AACosechero, APlantacion: Integer;
                                const AAnyoSem, AProducto:string ): real;
var
  rTaraPalet, rTaraCaja: Real;
  iCajasPalet: Integer;
  sAux: string;
begin
  with DEntradaCampo do
  begin
    qryResumenPalets.ParamByName('empresa').AsString:= AEmpresa;
    qryResumenPalets.ParamByName('centro').AsString:= ACentro;
    qryResumenPalets.ParamByName('fecha').AsDateTime:= AFecha;
    qryResumenPalets.ParamByName('entrada').AsInteger:= AEntrega;
    qryResumenPalets.ParamByName('cosechero').AsInteger:= AACosechero;
    qryResumenPalets.ParamByName('plantacion').AsInteger:= APlantacion;
    qryResumenPalets.ParamByName('ano_sem_planta').AsString:= AAnyoSem;
    qryResumenPalets.Open;
    //formato_e1l, total_palets_e1l, total_cajas_e1l
    Result:= 0;
    try
      while not qryResumenPalets.Eof do
      begin
        if not ObtenerTaraPalet( AEmpresa, ACentro, AProducto, qryResumenPalets.FieldByName('formato_e1l').AsString,
                               rTaraPalet, rTaraCaja, iCajasPalet, sAux ) then
        begin
            ShowMessage( 'Error al calcular la tara de los palets. ' + #13 + #10 + sAux );
        end;
        Result:= Result + bRoundTo( ( rTaraPalet * qryResumenPalets.FieldByName('total_palets_e1l').AsFloat ) +
                        ( rTaraCaja * qryResumenPalets.FieldByName('total_cajas_e1l').AsFloat ), 2);
        qryResumenPalets.Next;
      end;
    finally
      qryResumenPalets.Close;
    end;
  end;
end;
*)
function TFEntradaCampo.TaraPaletYCajas( const AEmpresa, ACentro, AProducto, AFormato: string;
                                         const AFecha: TDateTime; const AEntrega, ACajas: Integer  ): real;
var
  rTaraPalet, rTaraCaja: Real;
  iCajasPalet: Integer;
  sAux: string;
begin
  Result:= 0;
  with DEntradaCampo do
  begin
    if not ObtenerTaraPalet( AEmpresa, ACentro, AProducto, AFormato, rTaraPalet, rTaraCaja, iCajasPalet, sAux ) then
    begin
        ShowMessage( 'Error al calcular la tara de los palets. ' + #13 + #10 + sAux );
    end;
    Result:= Result + bRoundTo( rTaraPalet + ( rTaraCaja * ACajas ), 2);
  end;
end;

procedure TFEntradaCampo.PesarPalets( const ASectores: string );
var
  sSectores, sAux: string;
  rNeto, rBruto: Real;
  bFlag: Boolean;
  iNumPalets, iNumCajas: integer;
begin
  sSectores:= ASectores;
  with DEntradaCampo do
  begin
    TResumenDetalle.Open;
    QResumenDetalle.ParamByName('empresa').AsString:= QEntradaCampoC.fieldByName('empresa_ec').AsString;
    QResumenDetalle.ParamByName('centro').AsString:= QEntradaCampoC.fieldByName('centro_ec').AsString;
    QResumenDetalle.ParamByName('entrada').AsInteger:= QEntradaCampoC.fieldByName('numero_entrada_ec').AsInteger;
    QResumenDetalle.ParamByName('fecha').AsDateTime:= QEntradaCampoC.fieldByName('fecha_ec').AsDateTime;
    QResumenDetalle.Open;

    if not QResumenDetalle.IsEmpty then
    begin
      rNeto:= 0;
      rBruto:= 0;
      iNumPalets:= 0;
      iNumCajas:= 0;
      while not QResumenDetalle.EOF do
      begin
        TResumenDetalle.Insert;
        TResumenDetallecosechero.AsInteger:= QResumenDetalle.FieldByName('cosechero_e1l').AsInteger;
        TResumenDetalleplantacion.AsInteger:= QResumenDetalle.FieldByName('plantacion_e1l').AsInteger;
        TResumenDetalleano_sem_planta.Asstring:= QResumenDetalle.FieldByName('ano_sem_planta_e1l').Asstring;
        TResumenDetalletotal_cajas.AsInteger:= QResumenDetalle.FieldByName('total_cajas_e1l').AsInteger;
        TResumenDetalletotal_kgs.AsFloat:= QResumenDetalle.FieldByName('total_kilos_e1l').AsInteger;
        iNumPalets:= iNumPalets + QResumenDetalle.FieldByName('total_palets_e1l').AsInteger;
        iNumCajas:= iNumCajas + QResumenDetalle.FieldByName('total_cajas_e1l').AsInteger;

        rNeto:= rNeto + QResumenDetalle.FieldByName('total_kilos_e1l').AsInteger;
        rBruto:= rBruto + QResumenDetalle.FieldByName('total_bruto_e1l').AsInteger;
        try
          TResumenDetalle.Post;
        except
          on e:exception do
          begin
            TResumenDetalle.Cancel;
            sAux:= e.Message;
            sAux:= sAux+ #13 + #10 + '[Entrega incorrecta: Error al crear el detalle de la entrega - Tabla temporal]';
            QResumenDetalle.First;
            while not QResumenDetalle.Eof do
            begin
              sAux:= sAux+ #13 + #10 + '*******************************************************';
              sAux:= sAux+ #13 + #10 + '-Plantacion: ' + QResumenDetalle.FieldByname('cosechero_e1l').AsString +
                                       '-' + QResumenDetalle.FieldByname('plantacion_e1l').AsString +
                                       '-' + QResumenDetalle.FieldByname('ano_sem_planta_e1l').AsString +  #13 + #10 +
                                       '-Palets: ' + QResumenDetalle.FieldByname('total_palets_e1l').AsString +
                                      ' -Cajas: ' + QResumenDetalle.FieldByname('total_cajas_e1l').AsString;

              QResumenDetalle.Next;
            end;
            sAux:= sAux+ #13 + #10 + '*******************************************************';
            sAux:= sAux+ #13 + #10 + '* POR FAVOR CIERRE Y VUELVA A ABRIR EL PROGRAMA';
            sAux:= sAux+ #13 + #10 + '* BORRE UN PALET DE LA ENTRADA Y VUELVA A GRABARLO';
            sAux:= sAux+ #13 + #10 + '* SI PERSISTE EL ERROR LLAME A INFORMATICA';
            sAux:= sAux+ #13 + #10 + '*******************************************************';
            raise exception.Create( sAux );
          end;
        end;
        QResumenDetalle.Next;
      end;

      ActualizarCabecera( iNumPalets, iNumCajas, rBruto, rNeto );

      TResumenDetalle.First;
      while not TResumenDetalle.Eof do
      begin
        if sSectores = '' then
        begin
          bFlag:= InputQuery('INTRODUCE SECTORES ', 'Plantación ' +
                                            TResumenDetallecosechero.AsString + '/' +
                                            TResumenDetalleplantacion.AsString +
                                            '(MAX 10 Caracteres):', sSectores);
        end
        else
        begin
          bFlag:= True;
        end;

        frf_entradas2_l.Insert;
        frf_entradas2_lempresa_e2l.AsString:= QEntradaCampoCempresa_ec.AsString;
        frf_entradas2_lcentro_e2l.AsString:= QEntradaCampoCcentro_ec.AsString;
        frf_entradas2_lnumero_entrada_e2l.AsInteger:= QEntradaCampoCnumero_entrada_ec.AsInteger;
        frf_entradas2_lfecha_e2l.AsDateTime:= QEntradaCampoCfecha_ec.AsDateTime;
        frf_entradas2_lproducto_e2l.AsString:= QEntradaCampoCproducto_ec.AsString;
        frf_entradas2_lcosechero_e2l.AsInteger:= TResumenDetallecosechero.AsInteger;
        frf_entradas2_lplantacion_e2l.AsInteger:= TResumenDetalleplantacion.AsInteger;
        frf_entradas2_lano_sem_planta_e2l.AsString:= TResumenDetalleano_sem_planta.AsString;
        frf_entradas2_ltotal_cajas_e2l.AsInteger:= TResumenDetalletotal_cajas.AsInteger;
        frf_entradas2_ltotal_kgs_e2l.AsFloat:= TResumenDetalletotal_kgs.AsFloat;

        if bFlag then
          frf_entradas2_lsectores_e2l.AsString:= sSectores;

        try
          frf_entradas2_l.Post;
        except
          on e:exception do
          begin
            frf_entradas2_l.Cancel;
            sAux:= e.Message;
            sAux:= sAux+ #13 + #10 + '[Entrega incorrecta: Error al crear el detalle de la entrega - Tabla BD]';
            TResumenDetalle.First;
            while not TResumenDetalle.Eof do
            begin
              sAux:= sAux+ #13 + #10 + '*******************************************************';
              sAux:= sAux+ #13 + #10 + '-Entrega: ' + QEntradaCampoC.FieldByname('empresa_ec').AsString +
                                       '-' + QEntradaCampoC.FieldByname('centro_ec').AsString +
                                       '-' + QEntradaCampoC.FieldByname('numero_entrada_ec').AsString +
                                       '-' + QEntradaCampoC.FieldByname('fecha_ec').AsString +
                                       '-' + QEntradaCampoC.FieldByname('producto_ec').AsString +  #13 + #10 +
                                       '-Plantacion: ' + TResumenDetalle.FieldByname('cosechero').AsString +
                                       '-' + TResumenDetalle.FieldByname('plantacion').AsString +
                                       '-' + TResumenDetalle.FieldByname('ano_sem_planta').AsString +  #13 + #10 +
                                       '-Cajas: ' + TResumenDetalle.FieldByname('total_cajas').AsString +
                                       ' -Kilos: ' + TResumenDetalle.FieldByname('total_kgs').AsString;
              TResumenDetalle.Next;
            end;
            sAux:= sAux+ #13 + #10 + '*******************************************************';
            sAux:= sAux+ #13 + #10 + '* POR FAVOR CIERRE Y VUELVA A ABRIR EL PROGRAMA';
            sAux:= sAux+ #13 + #10 + '* BORRE UN PALET DE LA ENTRADA Y VUELVA A GRABARLO';
            sAux:= sAux+ #13 + #10 + '* SI PERSISTE EL ERROR LLAME A INFORMATICA';
            sAux:= sAux+ #13 + #10 + '*******************************************************';
            raise exception.Create( sAux );
          end;
        end;

        TResumenDetalle.Next;
      end;
    end;
    TResumenDetalle.Close;
    QResumenDetalle.Close;
  end;
end;

procedure TFEntradaCampo.ResumenDetalle;
var
  sSectores: string;
begin
  //Guardamos sector
  with DEntradaCampo.QSectorEntrada do
  begin
    ParamByName('empresa').AsString:= QEntradaCampoC.fieldByName('empresa_ec').AsString;
    ParamByName('centro').AsString:= QEntradaCampoC.fieldByName('centro_ec').AsString;
    ParamByName('entrada').AsInteger:= QEntradaCampoC.fieldByName('numero_entrada_ec').AsInteger;
    ParamByName('fecha').AsDateTime:= QEntradaCampoC.fieldByName('fecha_ec').AsDateTime;
    Open;
    sSectores:= FieldByName('sectores_e2l').AsString;
    Close;
  end;

  //Primero borramos el resumen actual
  with DEntradaCampo.QBorrarResumen do
  begin
    ParamByName('empresa').AsString:= QEntradaCampoC.fieldByName('empresa_ec').AsString;
    ParamByName('centro').AsString:= QEntradaCampoC.fieldByName('centro_ec').AsString;
    ParamByName('entrada').AsInteger:= QEntradaCampoC.fieldByName('numero_entrada_ec').AsInteger;
    ParamByName('fecha').AsDateTime:= QEntradaCampoC.fieldByName('fecha_ec').AsDateTime;
    ExecSQL;
  end;

  if QEntradaCampoC.fieldByName('pesar_palets_ec').AsInteger = 1 then
  begin
    //Pesar palets
    PesarPalets( sSectores );
  end
  else
  begin
    //Destarar camion
    DestararCamion( sSectores);
  end;
  RefrescarEntrada( QEntradaCampoCempresa_ec.AsString, QEntradaCampoCcentro_ec.AsString,
    QEntradaCampoCnumero_entrada_ec.AsInteger, QEntradaCampoCfecha_ec.AsDateTime);
end;

procedure TFEntradaCampo.QEntradaCampoLCalcFields(DataSet: TDataSet);
begin

  DataSet.FieldByName('des_plantacion_e1l').AsString:= DDescripciones.desPlantacion(
    DataSet.FieldByName('empresa_e1l').AsString, DataSet.FieldByName('producto_e1l').AsString,
    DataSet.FieldByName('cosechero_e1l').AsString, DataSet.FieldByName('plantacion_e1l').AsString,
    DataSet.FieldByName('ano_sem_planta_e1l').AsString );
  DataSet.FieldByName('des_formato').AsString:= DDescripciones.desFormato(
    DataSet.FieldByName('empresa_e1l').AsString, DataSet.FieldByName('centro_e1l').AsString,
    DataSet.FieldByName('producto_e1l').AsString, DataSet.FieldByName('formato_e1l').AsString);

  DataSet.FieldByName('des_variedad').AsString:= DDescripciones.desVariedad(
    DataSet.FieldByName('empresa_e1l').AsString, DataSet.FieldByName('producto_e1l').AsString,
     DataSet.FieldByName('variedad_e1l').AsString);

  if DataSet.FieldByName('categoria_e1l').AsInteger = 0 then
    DataSet.FieldByName('des_categoria').AsString:= 'ESTANDAR'
  else
  if DataSet.FieldByName('categoria_e1l').AsInteger = 1 then
    DataSet.FieldByName('des_categoria').AsString:= 'PRIMERA'
  else
  if DataSet.FieldByName('categoria_e1l').AsInteger = 2 then
    DataSet.FieldByName('des_categoria').AsString:= 'SEGUNDA'
  else
    DataSet.FieldByName('des_categoria').AsString:= '';

  if DataSet.FieldByName('calibre_e1l').AsInteger = 0 then
    DataSet.FieldByName('des_calibre').AsString:= 'PEQUEÑO'
  else
  if DataSet.FieldByName('calibre_e1l').AsInteger = 1 then
    DataSet.FieldByName('des_calibre').AsString:= 'GRANDE'
  else
    DataSet.FieldByName('des_calibre').AsString:= '';

  if DataSet.FieldByName('total_cajas_e1l').AsInteger = 0 then
    DataSet.FieldByName('kilos_caja').AsFloat:= 0
  else
    DataSet.FieldByName('kilos_caja').AsFloat:= bRoundTo( DataSet.FieldByName('kilos_e1l').AsFloat /
                                                          DataSet.FieldByName('total_cajas_e1l').AsFloat, 2);

end;


procedure TFEntradaCampo.QEntradaCampoCCalcFields(DataSet: TDataSet);
begin
  if DataSet.FieldByName('total_cajas_ec').AsInteger = 0 then
    DataSet.FieldByName('kilos_caja').AsFloat:= 0
  else
    DataSet.FieldByName('kilos_caja').AsFloat:= bRoundTo( DataSet.FieldByName('peso_neto_ec').AsFloat /
                                                          DataSet.FieldByName('total_cajas_ec').AsFloat, 2);
end;

function TFEntradaCampo.TieneEscandallos: boolean;
begin
  with DEntradaCampo.QTieneEscandallos do
  begin
    ParamByName('empresa').AsString:= QEntradaCampoC.fieldByName('empresa_ec').AsString;
    ParamByName('centro').AsString:= QEntradaCampoC.fieldByName('centro_ec').AsString;
    ParamByName('entrada').AsInteger:= QEntradaCampoC.fieldByName('numero_entrada_ec').AsInteger;
    ParamByName('fecha').AsDateTime:= QEntradaCampoC.fieldByName('fecha_ec').AsDateTime;
    Open;
    result:= not IsEmpty;
    Close;
  end;
end;

procedure TFEntradaCampo.btnImprimirClick(Sender: TObject);
begin
  QREntradaCampo:= TQEntradaCampo.Create( self );
  try
    Enabled:= False;
    QREntradaCampo.QCabecera.ParamByName('empresa').AsString:= QEntradaCampoCempresa_ec.AsString;
    QREntradaCampo.QCabecera.ParamByName('centro').AsString:= QEntradaCampoCcentro_ec.AsString;
    QREntradaCampo.QCabecera.ParamByName('entrada').AsInteger:= QEntradaCampoCnumero_entrada_ec.AsInteger;
    QREntradaCampo.QCabecera.ParamByName('fecha').AsDateTime:= QEntradaCampoCfecha_ec.AsDateTime;
    QREntradaCampo.QCabecera.Open;
    QREntradaCampo.QDetalle.Open;
    QREntradaCampo.QPalet.Open;
    QREntradaCampo.PrevShowThumbs:= False;
    QREntradaCampo.PrevShowSearch:= False;
    QREntradaCampo.Preview;
  finally
    Enabled:= True;
    QREntradaCampo.QDetalle.Close;
    QREntradaCampo.QPalet.Close;
    QREntradaCampo.QCabecera.Close;
    FreeAndNil( QREntradaCampo );
  end;
end;

procedure TFEntradaCampo.variedad_e1lChange(Sender: TObject);
begin
  nomVariedad.Caption:= DDescripciones.desVariedad( empresa_ec.Text, producto_ec.Text, variedad_e1l.Text );
end;

procedure TFEntradaCampo.btnVariedadClick(Sender: TObject);
var
  sAux: String;
begin
  sAux:= variedad_e1l.Text;
  if SeleccionaVariedad( self, variedad_e1l, empresa_ec.Text, producto_ec.Text, sAux ) then
    variedad_e1l.Text:= sAux;
end;

procedure TFEntradaCampo.QEntradaCampoCAfterCancel(DataSet: TDataSet);
begin
  sCosechero:= '';
  sPlantacion:= '';
  sFormato:= '';
  iCajas:= 0;
  iCategoria:= 0;
  iCalibre:= 0;
end;

end.

