unit UCadDepend;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Data.DB, Vcl.StdCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.Buttons;

type
  TFCadDepend = class(TForm)
    PageControl1: TPageControl;
    TabConsulta: TTabSheet;
    BitBtn1: TBitBtn;
    DBGrid1: TDBGrid;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    TabCadastro: TTabSheet;
    Label1: TLabel;
    BitBtn2: TBitBtn;
    EdNome: TEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCadDepend: TFCadDepend;

implementation

{$R *.dfm}

procedure TFCadDepend.BitBtn1Click(Sender: TObject);
begin
  TabConsulta.TabVisible := false;
  TabCadastro.TabVisible := true;
end;

procedure TFCadDepend.BitBtn2Click(Sender: TObject);
begin
  TabConsulta.TabVisible := true;
  TabCadastro.TabVisible := false;
end;

procedure TFCadDepend.BitBtn3Click(Sender: TObject);
begin
  TabConsulta.TabVisible := false;
  TabCadastro.TabVisible := true;
end;

end.
