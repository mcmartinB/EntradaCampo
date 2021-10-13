unit UQEntradaCampo;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, DBTables;

type
  TQEntradaCampo = class(TQuickRep)
    QCabecera: TQuery;
    DSCabecera: TDataSource;
    QDetalle: TQuery;
    QPalet: TQuery;
    DetailBand1: TQRBand;
    QRSubDetail1: TQRSubDetail;
    QRSubDetail2: TQRSubDetail;
    QRDBText9: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    ColumnHeaderBand1: TQRBand;
    QRDBText22: TQRDBText;
    QRDBText23: TQRDBText;
    QRDBText24: TQRDBText;
    QRDBText25: TQRDBText;
    QRDBText26: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    ChildBand1: TQRChildBand;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRBand1: TQRBand;
    QRBand2: TQRBand;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel21: TQRLabel;
    QRSysData1: TQRSysData;
    PageFooterBand1: TQRBand;
    QRSysData2: TQRSysData;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText27: TQRDBText;
    QRDBText28: TQRDBText;
    QRDBText29: TQRDBText;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    qrg1: TQRGroup;
    qre1: TQRDBText;
    qre2: TQRDBText;
    qre3: TQRDBText;
    qre4: TQRDBText;
    qre5: TQRDBText;
    qreformato_e1l: TQRDBText;
    qreformato_e1l1: TQRDBText;
    qrl1: TQRLabel;
    qrl2: TQRLabel;
    qrl3: TQRLabel;
    qrl4: TQRLabel;
    qrl5: TQRLabel;
    qrl6: TQRLabel;
    qrecalibre_e1l: TQRDBText;
    qrecategoria_e2l: TQRDBText;
    qrelogifruit_p: TQRDBText;
    qrdbtxtformato_e1l: TQRDBText;
    qrlbl1: TQRLabel;
    qrlbl2: TQRLabel;
    qrdbtxttotal_cajas_e1l: TQRDBText;
    qrbndPieDetalle: TQRBand;
    qrxpr1: TQRExpr;
    qrxpr2: TQRExpr;
    qrshp1: TQRShape;
    qrlbl3: TQRLabel;
    qrdbtxtkilos_e1l: TQRDBText;
    procedure QRDBText5Print(sender: TObject; var Value: String);
    procedure QRDBText27Print(sender: TObject; var Value: String);
    procedure QRDBText28Print(sender: TObject; var Value: String);
    procedure QRDBText29Print(sender: TObject; var Value: String);
    procedure QRDBText1Print(sender: TObject; var Value: String);
    procedure qre2Print(sender: TObject; var Value: String);
    procedure QRDBText2Print(sender: TObject; var Value: String);
    procedure qre4Print(sender: TObject; var Value: String);
    procedure qreformato_e1l1Print(sender: TObject; var Value: String);
    procedure qrecalibre_e1lPrint(sender: TObject; var Value: String);
    procedure qrecategoria_e2lPrint(sender: TObject; var Value: String);
    procedure qrelogifruit_pPrint(sender: TObject; var Value: String);
    procedure qrdbtxtformato_e1lPrint(sender: TObject; var Value: String);
    procedure qrdbtxtkilos_e1lPrint(sender: TObject; var Value: String);
  private

  public
    Constructor Create( AOwner: Tcomponent ); Override;
  end;

var
  QREntradaCampo: TQEntradaCampo;

implementation

uses UDEntradaCampo, UDDescripciones;

{$R *.DFM}

constructor TQEntradaCampo.Create( AOwner: Tcomponent );
begin
  inherited ;

  QCabecera.SQL.Clear;
  QCabecera.SQL.Add('select *');
  QCabecera.SQL.Add('from frf_entradas_c ');
  QCabecera.SQL.Add('where empresa_ec = :empresa ');
  QCabecera.SQL.Add('  and centro_ec = :centro ');
  QCabecera.SQL.Add('  and numero_entrada_ec = :entrada ');
  QCabecera.SQL.Add('  and fecha_ec = :fecha ');

  QDetalle.SQL.Clear;
  QDetalle.SQL.Add('select *');
  QDetalle.SQL.Add('from frf_entradas2_l ');
  QDetalle.SQL.Add('where empresa_e2l = :empresa_ec ');
  QDetalle.SQL.Add('  and centro_e2l = :centro_ec ');
  QDetalle.SQL.Add('  and numero_entrada_e2l = :numero_entrada_ec ');
  QDetalle.SQL.Add('  and fecha_e2l = :fecha_ec ');
  QDetalle.SQL.Add('order by cosechero_e2l, plantacion_e2l, ano_sem_planta_e2l, total_cajas_e2l ');


  QPalet.SQL.Clear;
  QPalet.SQL.Add('select frf_entradas1_l.*, logifruit_p ');
  QPalet.SQL.Add('from frf_entradas1_l, frf_pesos ');
  QPalet.SQL.Add('where empresa_e1l = :empresa_ec ');
  QPalet.SQL.Add('  and centro_e1l = :centro_ec ');
  QPalet.SQL.Add('  and numero_entrada_e1l = :numero_entrada_ec ');
  QPalet.SQL.Add('  and fecha_e1l = :fecha_ec ');
  QPalet.SQL.Add('  and empresa_p = :empresa_ec ');
  QPalet.SQL.Add('  and centro_p = :centro_ec ');
  QPalet.SQL.Add('  and producto_p = producto_e1l ');
  QPalet.SQL.Add('  and formato_p = formato_e1l ');
  QPalet.SQL.Add('order by cosechero_e1l, plantacion_e1l, ano_sem_planta_e1l, total_cajas_e1l ');

end;

procedure TQEntradaCampo.QRDBText5Print(sender: TObject;
  var Value: String);
begin
  Value:= DDescripciones.desEmpresa( value );
end;

procedure TQEntradaCampo.QRDBText27Print(sender: TObject;
  var Value: String);
begin
  Value:= DDescripciones.desCentro( QCabecera.FieldByName('empresa_ec').AsString, Value );
end;

procedure TQEntradaCampo.QRDBText28Print(sender: TObject;
  var Value: String);
begin
  Value:= DDescripciones.desProducto( QCabecera.FieldByName('empresa_ec').AsString, Value );
end;

procedure TQEntradaCampo.QRDBText29Print(sender: TObject;
  var Value: String);
begin
  Value:= DDescripciones.desTransporte( QCabecera.FieldByName('empresa_ec').AsString, Value );
end;

procedure TQEntradaCampo.QRDBText1Print(sender: TObject;
  var Value: String);
begin
  Value:= DDescripciones.desCosechero( QCabecera.FieldByName('empresa_ec').AsString, Value );
end;

procedure TQEntradaCampo.qre2Print(sender: TObject;
  var Value: String);
begin
  Value:= DDescripciones.desCosechero( QCabecera.FieldByName('empresa_ec').AsString, Value );
end;

procedure TQEntradaCampo.QRDBText2Print(sender: TObject;
  var Value: String);
begin
  Value:= DDescripciones.desPlantacion( QCabecera.FieldByName('empresa_ec').AsString, QCabecera.FieldByName('producto_ec').AsString,
    QDetalle.FieldByName('cosechero_e2l').AsString, Value, QDetalle.FieldByName('ano_sem_planta_e2l').AsString )
end;

procedure TQEntradaCampo.qre4Print(sender: TObject;
  var Value: String);
begin
  Value:= DDescripciones.desPlantacion( QCabecera.FieldByName('empresa_ec').AsString, QCabecera.FieldByName('producto_ec').AsString,
      QPalet.FieldByName('cosechero_e1l').AsString, Value, QPalet.FieldByName('ano_sem_planta_e1l').AsString )
end;

procedure TQEntradaCampo.qreformato_e1l1Print(sender: TObject;
  var Value: String);
begin
  Value:= DDescripciones.desFormato( QPalet.FieldByName('empresa_e1l').AsString, QPalet.FieldByName('centro_e1l').AsString,
                                     QPalet.FieldByName('producto_e1l').AsString, value);
end;

procedure TQEntradaCampo.qrecalibre_e1lPrint(sender: TObject;
  var Value: String);
begin
  if Value = '0' then
    Value:= 'PQ'
  else
  if Value = '1' then
    Value:= 'GR'
  else
    Value:= '';
end;

procedure TQEntradaCampo.qrecategoria_e2lPrint(sender: TObject;
  var Value: String);
begin
  if Value = '1' then
    Value:= '1ª'
  else
  if Value = '2' then
    Value:= '2ª'
  else
    Value:= '';
end;

procedure TQEntradaCampo.qrelogifruit_pPrint(sender: TObject;
  var Value: String);
begin
  if Value = '0' then
    Value:= 'NO'
  else
  if Value = '1' then
    Value:= 'SI'
  else
    Value:= '';
end;

procedure TQEntradaCampo.qrdbtxtformato_e1lPrint(sender: TObject;
  var Value: String);
begin
  Value:=   DDescripciones.desVariedad(
    QPalet.FieldByname('empresa_e1l').AsString, QPalet.FieldByname('producto_e1l').AsString,
     QPalet.FieldByname('variedad_e1l').AsString);
end;

procedure TQEntradaCampo.qrdbtxtkilos_e1lPrint(sender: TObject;
  var Value: String);
begin
  if QPalet.FieldByName('total_cajas_e1l').AsInteger = 0 then
    Value:= ''
  else
    Value:= FormatFloat( ' #0.00', QPalet.FieldByName('kilos_e1l').AsFloat / QPalet.FieldByName('total_cajas_e1l').AsFloat);
end;

end.
