object DEntradaCampo: TDEntradaCampo
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 666
  Width = 488
  object QListado: TQuery
    DatabaseName = 'Database'
    Left = 128
    Top = 24
  end
  object Database: TDatabase
    DatabaseName = 'Database'
    DriverName = 'INFORMIX'
    LoginPrompt = False
    Params.Strings = (
      'SERVER NAME=iserver1'
      'DATABASE NAME=comersat'
      'USER NAME=informix'
      'OPEN MODE=READ/WRITE'
      'SCHEMA CACHE SIZE=8'
      'LANGDRIVER=DB850ES0'
      'SQLQRYMODE='
      'SQLPASSTHRU MODE=SHARED AUTOCOMMIT'
      'LOCK MODE=5'
      'DATE MODE=0'
      'DATE SEPARATOR=/'
      'SCHEMA CACHE TIME=-1'
      'MAX ROWS=-1'
      'BATCH COUNT=200'
      'ENABLE SCHEMA CACHE=FALSE'
      'SCHEMA CACHE DIR='
      'ENABLE BCD=FALSE'
      'LIST SYNONYMS=NONE'
      'DBNLS='
      'COLLCHAR='
      'BLOBS TO CACHE=64'
      'BLOB SIZE=32'
      'PASSWORD=informix')
    SessionName = 'Default'
    Left = 56
    Top = 24
  end
  object QBorrarDetalle: TQuery
    DatabaseName = 'Database'
    Left = 56
    Top = 88
  end
  object QBorrarPalets: TQuery
    DatabaseName = 'Database'
    Left = 136
    Top = 88
  end
  object QGetEntrada: TQuery
    DatabaseName = 'Database'
    SQL.Strings = (
      'select cont_entradas_c contador'
      'from frf_centros'
      'where empresa_c = :empresa'
      'and centro_c = :centro')
    Left = 56
    Top = 160
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'empresa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'centro'
        ParamType = ptUnknown
      end>
  end
  object QPutEntrada: TQuery
    DatabaseName = 'Database'
    SQL.Strings = (
      'update frf_centros'
      'set cont_entradas_c = :contador'
      'where empresa_c = :empresa'
      'and centro_c = :centro')
    Left = 136
    Top = 160
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'contador'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'empresa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'centro'
        ParamType = ptUnknown
      end>
  end
  object QTemp: TQuery
    DatabaseName = 'Database'
    Left = 248
    Top = 24
  end
  object QAux: TQuery
    DatabaseName = 'Database'
    Left = 184
    Top = 24
  end
  object QTieneEscandallos: TQuery
    DatabaseName = 'Database'
    SQL.Strings = (
      'select cont_entradas_c contador'
      'from frf_centros'
      'where empresa_c = :empresa'
      'and centro_c = :centro')
    Left = 56
    Top = 216
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'empresa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'centro'
        ParamType = ptUnknown
      end>
  end
  object QCambiarTransportista: TQuery
    DatabaseName = 'Database'
    SQL.Strings = (
      'select cont_entradas_c contador'
      'from frf_centros'
      'where empresa_c = :empresa'
      'and centro_c = :centro')
    Left = 56
    Top = 272
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'empresa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'centro'
        ParamType = ptUnknown
      end>
  end
  object QPesos: TQuery
    DatabaseName = 'Database'
    SQL.Strings = (
      'select cont_entradas_c contador'
      'from frf_centros'
      'where empresa_c = :empresa'
      'and centro_c = :centro')
    Left = 56
    Top = 328
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'empresa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'centro'
        ParamType = ptUnknown
      end>
  end
  object QTaraCamion: TQuery
    DatabaseName = 'Database'
    SQL.Strings = (
      'select cont_entradas_c contador'
      'from frf_centros'
      'where empresa_c = :empresa'
      'and centro_c = :centro')
    Left = 136
    Top = 328
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'empresa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'centro'
        ParamType = ptUnknown
      end>
  end
  object QResumenDetalle: TQuery
    DatabaseName = 'Database'
    SQL.Strings = (
      'select cont_entradas_c contador'
      'from frf_centros'
      'where empresa_c = :empresa'
      'and centro_c = :centro')
    Left = 56
    Top = 392
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'empresa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'centro'
        ParamType = ptUnknown
      end>
  end
  object TResumenDetalle: TkbmMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <>
    IndexDefs = <>
    SortOptions = []
    PersistentBackup = False
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcCopy]
    LoadedCompletely = False
    SavedCompletely = False
    FilterOptions = []
    Version = '5.51'
    LanguageID = 0
    SortID = 0
    SubLanguageID = 1
    LocaleID = 1024
    Left = 56
    Top = 456
    object TResumenDetallecosechero: TIntegerField
      FieldName = 'cosechero'
    end
    object TResumenDetalleplantacion: TIntegerField
      FieldName = 'plantacion'
    end
    object TResumenDetalleano_sem_planta: TStringField
      FieldName = 'ano_sem_planta'
      Size = 6
    end
    object TResumenDetalletotal_cajas: TIntegerField
      FieldName = 'total_cajas'
    end
    object TResumenDetalletotal_kgs: TFloatField
      FieldName = 'total_kgs'
    end
  end
  object QBorrarResumen: TQuery
    DatabaseName = 'Database'
    SQL.Strings = (
      'select cont_entradas_c contador'
      'from frf_centros'
      'where empresa_c = :empresa'
      'and centro_c = :centro')
    Left = 160
    Top = 392
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'empresa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'centro'
        ParamType = ptUnknown
      end>
  end
  object QActualizarCabecera: TQuery
    DatabaseName = 'Database'
    SQL.Strings = (
      'select cont_entradas_c contador'
      'from frf_centros'
      'where empresa_c = :empresa'
      'and centro_c = :centro')
    Left = 264
    Top = 392
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'empresa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'centro'
        ParamType = ptUnknown
      end>
  end
  object frf_entradas2_l: TQuery
    DatabaseName = 'Database'
    RequestLive = True
    SQL.Strings = (
      'select *'
      'from frf_entradas2_l')
    Left = 160
    Top = 456
    object frf_entradas2_lempresa_e2l: TStringField
      FieldName = 'empresa_e2l'
      Origin = '"COMER.DESARROLLO".frf_entradas2_l.empresa_e2l'
      FixedChar = True
      Size = 3
    end
    object frf_entradas2_lcentro_e2l: TStringField
      FieldName = 'centro_e2l'
      Origin = '"COMER.DESARROLLO".frf_entradas2_l.centro_e2l'
      FixedChar = True
      Size = 1
    end
    object frf_entradas2_lnumero_entrada_e2l: TIntegerField
      FieldName = 'numero_entrada_e2l'
      Origin = '"COMER.DESARROLLO".frf_entradas2_l.numero_entrada_e2l'
    end
    object frf_entradas2_lfecha_e2l: TDateField
      FieldName = 'fecha_e2l'
      Origin = '"COMER.DESARROLLO".frf_entradas2_l.fecha_e2l'
    end
    object frf_entradas2_lcosechero_e2l: TSmallintField
      FieldName = 'cosechero_e2l'
      Origin = '"COMER.DESARROLLO".frf_entradas2_l.cosechero_e2l'
    end
    object frf_entradas2_lplantacion_e2l: TSmallintField
      FieldName = 'plantacion_e2l'
      Origin = '"COMER.DESARROLLO".frf_entradas2_l.plantacion_e2l'
    end
    object frf_entradas2_lano_sem_planta_e2l: TStringField
      FieldName = 'ano_sem_planta_e2l'
      Origin = '"COMER.DESARROLLO".frf_entradas2_l.ano_sem_planta_e2l'
      FixedChar = True
      Size = 6
    end
    object frf_entradas2_ltotal_cajas_e2l: TIntegerField
      FieldName = 'total_cajas_e2l'
      Origin = '"COMER.DESARROLLO".frf_entradas2_l.total_cajas_e2l'
    end
    object frf_entradas2_ltotal_kgs_e2l: TFloatField
      FieldName = 'total_kgs_e2l'
      Origin = '"COMER.DESARROLLO".frf_entradas2_l.total_kgs_e2l'
    end
    object frf_entradas2_lproducto_e2l: TStringField
      DisplayWidth = 3
      FieldName = 'producto_e2l'
      Origin = '"COMER.DESARROLLO".frf_entradas2_l.producto_e2l'
      FixedChar = True
      Size = 3
    end
    object frf_entradas2_lsectores_e2l: TStringField
      FieldName = 'sectores_e2l'
      Origin = '"COMER.DESARROLLO".frf_entradas2_l.sectores_e2l'
      FixedChar = True
      Size = 10
    end
  end
  object QPalets: TQuery
    DatabaseName = 'Database'
    SQL.Strings = (
      'select cont_entradas_c contador'
      'from frf_centros'
      'where empresa_c = :empresa'
      'and centro_c = :centro')
    Left = 56
    Top = 520
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'empresa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'centro'
        ParamType = ptUnknown
      end>
  end
  object QSectorEntrada: TQuery
    DatabaseName = 'Database'
    SQL.Strings = (
      'select cont_entradas_c contador'
      'from frf_centros'
      'where empresa_c = :empresa'
      'and centro_c = :centro')
    Left = 48
    Top = 576
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'empresa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'centro'
        ParamType = ptUnknown
      end>
  end
  object qryResumenPalets: TQuery
    DatabaseName = 'Database'
    SQL.Strings = (
      'select cont_entradas_c contador'
      'from frf_centros'
      'where empresa_c = :empresa'
      'and centro_c = :centro')
    Left = 392
    Top = 392
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'empresa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'centro'
        ParamType = ptUnknown
      end>
  end
end
