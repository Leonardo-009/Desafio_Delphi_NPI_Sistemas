unit UPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

type
  TFPrincipal = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    BtnSocio: TBitBtn;
    BtnDepend: TBitBtn;
    procedure BtnSocioClick(Sender: TObject);
    procedure BtnDependClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPrincipal: TFPrincipal;
  GTabela, GAlias : String;

implementation

{$R *.dfm}

uses UCadSocio, UDmNpi;

procedure TFPrincipal.BtnSocioClick(Sender: TObject);
begin
  GTabela := 'tb_Socio';
  GAlias := ' so';
  FCadSocio.RgPart.Caption := 'Status';
  FCadSocio.RgPart.Items.Clear;
  FCadSocio.RgPart.Items.Add('Inativo');
  FCadSocio.RgPart.Items.Add('Ativo');
  FCadSocio.RgPart.itemindex := 1;
  FCadSocio.LbCodSoc.Visible := false;
  FCadSocio.EdCodSoc.Visible := false;
  FCadSocio.LbNomSoc.Visible := false;
  FCadSocio.LbRenda.Visible := true;
  FCadSocio.EdRenda.Visible := true;
  FCadSocio.ChkAtivo.Visible := true;
  FCadSocio.LbIdade.Visible := false;
  FCadSocio.EdIdade.Visible := false;
  FCadSocio.BtnRel.Visible := true;

  FCadSocio.TabConsulta.TabVisible := true;
  FCadSocio.TabCadastro.TabVisible := false;
  FCadSocio.Showmodal;
end;

procedure TFPrincipal.BtnDependClick(Sender: TObject);
begin
  GTabela := 'tb_Depend';
  GAlias := ' de';
  FCadSocio.RgPart.Caption := 'Participante';
  FCadSocio.RgPart.Items.Clear;
  FCadSocio.RgPart.Items.Add('Sócio');
  FCadSocio.RgPart.Items.Add('Dependente');
  FCadSocio.RgPart.itemindex := 0;
  FCadSocio.LbCodSoc.Visible := true;
  FCadSocio.EdCodSoc.Visible := true;
  FCadSocio.LbNomSoc.Visible := true;
  FCadSocio.LbRenda.Visible := false;
  FCadSocio.EdRenda.Visible := false;
  FCadSocio.ChkAtivo.Visible := false;
  FCadSocio.LbIdade.Visible := true;
  FCadSocio.EdIdade.Visible := true;
  FCadSocio.BtnRel.Visible := false;

  FCadSocio.TabConsulta.TabVisible := true;
  FCadSocio.TabCadastro.TabVisible := false;
  FCadSocio.Showmodal;
end;

procedure TFPrincipal.FormCreate(Sender: TObject);
begin
  //Application.CreateForm(TDMNpi, DMNpi);
  DMNpi.DbConect.Connected := true;  // Conexão com o banco principal
end;

end.
