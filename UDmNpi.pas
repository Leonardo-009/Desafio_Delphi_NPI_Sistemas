unit UDmNpi;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB;

type
  TDMNpi = class(TDataModule)
    DbConect: TADOConnection;
    QrConsulta: TADOQuery;
    QrExecuta: TADOQuery;
    DsCons: TDataSource;
    DsRelat: TDataSource;
    QrRelat: TADOQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMNpi: TDMNpi;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
