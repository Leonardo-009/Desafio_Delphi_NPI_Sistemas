object DMNpi: TDMNpi
  Height = 480
  Width = 640
  object DbConect: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=123456Sc;Persist Security Info=True' +
      ';User ID=sa;Initial Catalog=DesafioNPI;Data Source=DESKTOP-4J2T7' +
      '66'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 88
    Top = 72
  end
  object QrConsulta: TADOQuery
    Connection = DbConect
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tb_Socio')
    Left = 248
    Top = 72
  end
  object QrExecuta: TADOQuery
    Connection = DbConect
    Parameters = <>
    SQL.Strings = (
      'select * from tb_depend')
    Left = 344
    Top = 72
  end
  object DsCons: TDataSource
    DataSet = QrConsulta
    Left = 248
    Top = 152
  end
  object DsRelat: TDataSource
    DataSet = QrRelat
    Left = 88
    Top = 248
  end
  object QrRelat: TADOQuery
    Connection = DbConect
    Parameters = <>
    SQL.Strings = (
      'select * from tb_depend')
    Left = 168
    Top = 248
  end
end
