unit UFFiltro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, BSpeedButton, BGridButton, BEdit, BDEdit,
  BCalendarButton;

type
  TFFiltro = class(TForm)
    LEmpresa_p: TLabel;
    empresa_ec: TBEdit;
    btnEmpresa: TBGridButton;
    Label1: TLabel;
    centro_ec: TBEdit;
    btnCentro: TBGridButton;
    nomEmpresa: TStaticText;
    nomCentro: TStaticText;
    Label11: TLabel;
    fecha_desde_ec: TBEdit;
    Label14: TLabel;
    producto_ec: TBEdit;
    btnProducto: TBGridButton;
    nomProducto: TStaticText;
    LPedido: TLabel;
    numero_entrada_ec: TBEdit;
    btnAceptar: TBitBtn;
    btnCancelar: TBitBtn;
    Label2: TLabel;
    transportista_ec: TBEdit;
    btnTransportistas: TBGridButton;
    nomTransportista: TStaticText;
    Label4: TLabel;
    fecha_hasta_ec: TBEdit;
    btnFecha_Desde: TBCalendarButton;
    btnFechaHasta: TBCalendarButton;
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure empresa_ecChange(Sender: TObject);
    procedure centro_ecChange(Sender: TObject);
    procedure producto_ecChange(Sender: TObject);
    procedure transportista_ecChange(Sender: TObject);
    procedure btnProductoClick(Sender: TObject);
    procedure btnEmpresaClick(Sender: TObject);
    procedure btnCentroClick(Sender: TObject);
    procedure btnTransportistasClick(Sender: TObject);
    procedure btnFecha_DesdeClick(Sender: TObject);
    procedure btnFechaHastaClick(Sender: TObject);
  private
    { Private declarations }
    sAux: string;

    procedure DesplegarRejilla( const AControl: TControl );
  public
    { Public declarations }
    function GetFiltro: String;
  end;

implementation

{$R *.dfm}

uses UFRejilla, UDDescripciones, UFCalendario, UFTransportistas;

function TFFiltro.GetFiltro: String;
var
  bFlag: Boolean;
begin
  bFlag:= false;
  result:= '';

    if Trim( empresa_ec.Text ) <> '' then
    begin
       result:= ' empresa_ec = ' + QuotedStr( empresa_ec.Text );
       bFlag:= True;
    end;
    if Trim( centro_ec.Text ) <> '' then
    begin
       if bFlag then
         result:= result + ' and ';
       result:= result + ' centro_ec = ' + QuotedStr( centro_ec.Text );
       bFlag:= True;
    end;
    if Trim( numero_entrada_ec.Text ) <> '' then
    begin
       if bFlag then
         result:= result + ' and ';
       result:= result + ' numero_entrada_ec = ' + QuotedStr( numero_entrada_ec.Text );
       bFlag:= True;
    end;
    if Trim( producto_ec.Text ) <> '' then
    begin
       if bFlag then
         result:= result + ' and ';
       result:= result + ' producto_ec = ' + QuotedStr( producto_ec.Text );
       bFlag:= True;
    end;
    if Trim( transportista_ec.Text ) <> '' then
    begin
       if bFlag then
         result:= result + ' and ';
       result:= result + ' transportista_ec = ' + QuotedStr( transportista_ec.Text );
       bFlag:= True;
    end;
    if ( Trim( fecha_desde_ec.Text ) <> '' ) and ( Trim( fecha_hasta_ec.Text ) <> '' ) then
    begin
       if bFlag then
         result:= result + ' and ';
       result:= result + ' fecha_ec between ' + QuotedStr( fecha_desde_ec.Text ) + ' and ' + QuotedStr( fecha_hasta_ec.Text );
       bFlag:= True;
    end
    else
    if ( Trim( fecha_desde_ec.Text ) <> '' ) then
    begin
       if bFlag then
         result:= result + ' and ';
       result:= result + ' fecha_ec = ' + QuotedStr( fecha_desde_ec.Text );
       bFlag:= True;
    end;
  if bFlag then
    result:= 'where ' + result;
end;

procedure TFFiltro.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    vk_f1:
          btnAceptar.Click;
    vk_escape:
          btnCancelar.Click;
  end;
end;

procedure TFFiltro.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
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

procedure TFFiltro.DesplegarRejilla( const AControl: TControl );
var
  sAux: string;
begin
  sAux:= TEdit( AControl ).Text;

  if ( AControl.Name = fecha_desde_ec.Name ) or ( AControl.Name = fecha_hasta_ec.Name ) then
  begin
    PonFecha( self, AControl, SAux, sAux );
  end
  else
  if AControl.Name = empresa_ec.Name then
  begin
    SeleccionaEmpresa( self, AControl, SAux );
  end
  else
  if ( AControl.Name = centro_ec.Name ) then
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
  end;

  TEdit( AControl ).Text:= sAux;
end;

procedure TFFiltro.empresa_ecChange(Sender: TObject);
begin
  nomEmpresa.Caption:= DDescripciones.desEmpresa( empresa_ec.Text );
  nomCentro.Caption:= DDescripciones.desCentro( empresa_ec.Text, centro_ec.Text );
  nomProducto.Caption:= DDescripciones.desProducto( empresa_ec.Text, producto_ec.Text );
  nomTransportista.Caption:= DDescripciones.desTransporte( empresa_ec.Text, transportista_ec.Text );
end;

procedure TFFiltro.centro_ecChange(Sender: TObject);
begin
  nomCentro.Caption:= DDescripciones.desCentro( empresa_ec.Text, centro_ec.Text );
end;

procedure TFFiltro.producto_ecChange(Sender: TObject);
begin
  nomProducto.Caption:= DDescripciones.desProducto( empresa_ec.Text, producto_ec.Text );
end;

procedure TFFiltro.transportista_ecChange(Sender: TObject);
begin
  nomTransportista.Caption:= DDescripciones.desTransporte( empresa_ec.Text, transportista_ec.Text );
end;

procedure TFFiltro.btnEmpresaClick(Sender: TObject);
begin
  sAux:= empresa_ec.Text;
  if SeleccionaEmpresa( self, empresa_ec, sAux ) then
    empresa_ec.Text:= sAux;
end;

procedure TFFiltro.btnCentroClick(Sender: TObject);
begin
  sAux:= centro_ec.Text;
  if SeleccionaCentro( self, centro_ec, empresa_ec.text, sAux ) then
    centro_ec.Text:= sAux;
end;

procedure TFFiltro.btnProductoClick(Sender: TObject);
begin
  sAux:= producto_ec.Text;
  if SeleccionaProducto( self, producto_ec, empresa_ec.text, sAux ) then
    producto_ec.Text:= sAux;
end;

procedure TFFiltro.btnTransportistasClick(Sender: TObject);
begin
  sAux:= transportista_ec.Text;
  if SeleccionaTransportista( self, transportista_ec, empresa_ec.text, sAux ) then
    transportista_ec.Text:= sAux;
end;


procedure TFFiltro.btnFecha_DesdeClick(Sender: TObject);
begin
  sAux:= fecha_desde_ec.Text;
  if PonFecha( self, fecha_desde_ec, fecha_desde_ec.Text, sAux ) then
    fecha_desde_ec.Text:= sAux;
end;

procedure TFFiltro.btnFechaHastaClick(Sender: TObject);
begin
  sAux:= fecha_hasta_ec.Text;
  if PonFecha( self,fecha_hasta_ec, fecha_hasta_ec.Text, sAux ) then
    fecha_hasta_ec.Text:= sAux;
end;

end.
