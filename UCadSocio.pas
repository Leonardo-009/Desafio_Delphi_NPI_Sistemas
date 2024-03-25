unit UCadSocio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Data.DB, Vcl.Grids, Vcl.DBGrids, UDmNpi, Vcl.ExtCtrls, UPrincipal, URelatorio;

type
  TFCadSocio = class(TForm)
    PageControl1: TPageControl;
    TabConsulta: TTabSheet;
    TabCadastro: TTabSheet;
    BtnInc: TBitBtn;
    DBGrid1: TDBGrid;
    BtnAlt: TBitBtn;
    BtnExc: TBitBtn;
    Label1: TLabel;
    EdNome: TEdit;
    LbIdade: TLabel;
    EdIdade: TEdit;
    ChkAtivo: TCheckBox;
    LbRenda: TLabel;
    EdRenda: TEdit;
    Label4: TLabel;
    EdBusca: TEdit;
    RgPart: TRadioGroup;
    BitBtn5: TButton;
    PnRodape: TPanel;
    PnMeio: TPanel;
    PnTopo: TPanel;
    LbCodSoc: TLabel;
    EdCodSoc: TEdit;
    LbNomSoc: TLabel;
    BitBtn1: TBitBtn;
    BtnRel: TButton;
    BtCancela: TBitBtn;
    procedure BtnIncClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BtnAltClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure EdRendaKeyPress(Sender: TObject; var Key: Char);
    procedure BtCancelaClick(Sender: TObject);
    procedure BtnExcClick(Sender: TObject);
    procedure BtnRelClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
    str_sql : String;
    TpOper, IdPartic : Integer;
  end;

var
  FCadSocio: TFCadSocio;

implementation

{$R *.dfm}

procedure TFCadSocio.BtnIncClick(Sender: TObject);
begin
  TpOper := 1;
  TabConsulta.TabVisible := false;
  TabCadastro.TabVisible := true;
end;

procedure TFCadSocio.BtnRelClick(Sender: TObject);
begin
  str_sql := '';
  if edbusca.Text <> '' then
    str_sql := ' WHERE '+GAlias+'.nome like '+Quotedstr(edbusca.Text+'%')+' ';

  if str_sql = '' then
    str_sql := ' WHERE '+GAlias+'.Ativo = '+IntToStr(RgPart.itemindex)+' '
  else
    str_sql := str_sql + ' and '+GAlias+'.Ativo = '+IntToStr(RgPart.itemindex)+' ';
  DmNpi.QrRelat.Close;
  DmNpi.QrRelat.sql.Clear;
  DmNpi.QrRelat.sql.Add('select so.Id as IdPai, so.Nome as NomePai, ');
  DmNpi.QrRelat.sql.Add(' de.Id as IdFilho, de.Nome as NomeFilho ');
  DmNpi.QrRelat.sql.Add(' from tb_Socio so ');
  DmNpi.QrRelat.sql.Add('   LEFT JOIN ');
  DmNpi.QrRelat.sql.Add('     tb_Depend de ON so.Id = de.Id_Socio ');
  DmNpi.QrRelat.sql.Add(str_sql);
  DmNpi.QrRelat.sql.Add(' order by so.nome ');
  DmNpi.QrRelat.open;

  FRelatorio.ReportSocios.PrePare;
  FRelatorio.ReportSocios.Preview;
end;

procedure TFCadSocio.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if not odd(DmNpi.QrConsulta.RecNo) then // zebra
   if not (gdSelected in State) then
     begin
       DBGrid1.Canvas.Brush.Color := clskyblue;
       DBGrid1.Canvas.FillRect(Rect);
       DBGrid1.DefaultDrawDataCell(Rect, Column.Field, State);
     end;
end;

procedure TFCadSocio.EdRendaKeyPress(Sender: TObject; var Key: Char);
begin
  if key in ['0'..'9', ',', #13, #8] = false then
    key := #0;
end;

procedure TFCadSocio.FormShow(Sender: TObject);
begin
  TpOper := 0;
  DmNpi.QrConsulta.Close;
  DmNpi.QrConsulta.sql.Clear;
  DmNpi.QrConsulta.sql.Add('select '+GAlias+'.* from '+GTabela+GAlias+' order by '+GAlias+'.nome ');
  DmNpi.QrConsulta.open;

  EdBusca.SetFocus;
end;

procedure TFCadSocio.BitBtn1Click(Sender: TObject);
var
  Nome: string;
  Renda: Double;
  Idade: Integer;
begin
  // Obtendo os dados dos campos de entrada
  Nome := Trim(EdNome.Text);
  if Nome = '' then
  begin
    ShowMessage('Por favor, insira um nome.');
    Exit;
  end
  else if Length(Nome) < 5 then
  begin
    ShowMessage('O nome deve ter pelo menos 5 caracteres.');
    Exit;
  end
  else if Length(Nome) > 50 then
  begin
    ShowMessage('O nome não pode ter mais de 50 caracteres.');
    Exit;
  end;

  // Validando o campo de renda apenas para sócios
  if GTabela = 'tb_Socio' then
  begin
    if Trim(EdRenda.Text) = '0,00' then
    begin
      ShowMessage('Por favor, insira um valor para a renda.');
      Exit;
    end;

    begin
      // Tenta converter o valor digitado para um número decimal
      if TryStrToFloat(EdRenda.Text, Renda) then
      begin
        // Formata o valor para o formato desejado e o exibe no campo de renda
        EdRenda.Text := FormatFloat('#,##0.00', Renda);
      end
      else
      if not TryStrToFloat(EdRenda.Text, Renda) or (Renda < 0) then
      begin
        // Se a conversão falhar, avisa ao usuário
        ShowMessage('Por favor, insira uma renda válida.');
        EdRenda.SetFocus;
      end;
    end;
  end;

  // Verificando se o campo de idade está visível (caso seja um dependente)
  if EdIdade.Visible then
  begin
    // Validando o campo de idade
    if Trim(EdIdade.Text) = '0' then
    begin
      ShowMessage('Por favor, insira um valor válido para a idade.');
      Exit;
    end;

    if not TryStrToInt(EdIdade.Text, Idade) or (Idade <= 0) then
    begin
      ShowMessage('Por favor, insira uma idade válida.');
      Exit;
    end;
  end;

// Verificando se o campo de idade está visível (caso seja um dependente)
if EdIdade.Visible then
begin
  // Validando o campo de idade
  if Trim(EdIdade.Text) = '0' then
  begin
    ShowMessage('Por favor, insira um valor válido para a idade.');
    Exit;
  end;

  if not TryStrToInt(EdIdade.Text, Idade) or (Idade <= 0) then
  begin
    ShowMessage('Por favor, insira uma idade válida.');
    Exit;
  end;
end;

  // Continuar com a operação apenas se todas as validações passarem
  try
    // Código original de inserção ou atualização de registro no banco de dados
    DmNpi.QrExecuta.Close;
    DmNpi.QrExecuta.SQL.Clear;
    if TpOper = 1 then
    begin // Modo de inclusão
      if GTabela = 'tb_Socio' then
      begin
        str_sql := 'INSERT INTO tb_Socio (Nome, Renda, Ativo) VALUES ( ' +
          '' + QuotedStr(Nome) + ', ' +
          ':Renda, ' +
          ':Ativo ' +
          ')';
        DmNpi.QrExecuta.SQL.Add(str_sql);
        DmNpi.QrExecuta.Parameters.ParamByName('Renda').Value := Renda;
        DmNpi.QrExecuta.Parameters.ParamByName('Ativo').Value := chkativo.Checked;
      end
      else
      begin
        str_sql := 'INSERT INTO tb_Depend (Id_Socio, Nome, Idade) VALUES ( ' +
          ':IdSocio, ' +
          '' + QuotedStr(Nome) + ', ' +
          ':Idade ' +
          ')';
        DmNpi.QrExecuta.SQL.Add(str_sql);
        DmNpi.QrExecuta.Parameters.ParamByName('IdSocio').Value := StrToInt(EdCodSoc.Text);
        DmNpi.QrExecuta.Parameters.ParamByName('Idade').Value := Idade;
      end;
    end
    else
    begin // modo de alteração
      if GTabela = 'tb_Socio' then
      begin
        str_sql := 'UPDATE tb_Socio SET ' +
          ' Nome = ' + QuotedStr(Nome) + ', ' +
          ' Renda = :Renda, ' +
          ' Ativo = :Ativo ' +
          ' WHERE Id = :IdSoc';
        DmNpi.QrExecuta.SQL.Add(str_sql);
        DmNpi.QrExecuta.Parameters.ParamByName('Renda').Value := Renda;
        DmNpi.QrExecuta.Parameters.ParamByName('Ativo').Value := chkativo.Checked;
        DmNpi.QrExecuta.Parameters.ParamByName('IdSoc').Value := IdPartic;
      end
      else
      begin
        str_sql := 'UPDATE tb_Depend SET ' +
          ' Nome = ' + QuotedStr(Nome) + ', ' +
          ' Id_Socio = :IdSocio, ' +
          ' Idade = :Idade ' +
          ' WHERE Id = :IdDep';
        DmNpi.QrExecuta.SQL.Add(str_sql);
        DmNpi.QrExecuta.Parameters.ParamByName('IdSocio').Value := StrToInt(EdCodSoc.Text);
        DmNpi.QrExecuta.Parameters.ParamByName('Idade').Value := Idade;
        DmNpi.QrExecuta.Parameters.ParamByName('IdDep').Value := IdPartic;
      end;
    end;
    DmNpi.QrExecuta.ExecSQL;

    MessageDlg('Registro gravado com sucesso', mtInformation, [mbOK], 0);
  except
    on E: Exception do
    begin
      ShowMessage('Ocorreu um erro: ' + E.Message);
    end;
  end;
end;


procedure TFCadSocio.BitBtn2Click(Sender: TObject);
begin
  TabConsulta.TabVisible := true;
  TabCadastro.TabVisible := false;
end;

procedure TFCadSocio.BitBtn5Click(Sender: TObject);
var
  lInner_sql : String;
begin
  str_sql := '';
  lInner_sql := '';

  if GTabela = 'tb_Socio' then
    begin
      if edbusca.Text <> '' then
        str_sql := ' WHERE '+GAlias+'.nome like '+Quotedstr(edbusca.Text+'%')+' ';

      if str_sql = '' then
        str_sql := ' WHERE '+GAlias+'.Ativo = '+IntToStr(RgPart.itemindex)+' '
      else
        str_sql := str_sql + ' and '+GAlias+'.Ativo = '+IntToStr(RgPart.itemindex)+' ';
    end
  else
    begin
      if RgPart.itemindex = 0 then
        begin // Se for 0, significa que tem que fazer a relação sócio e dependente
          if edbusca.Text <> '' then
            str_sql := ' WHERE so.nome like '+Quotedstr(edbusca.Text+'%')+' ';
          lInner_sql := ' INNER JOIN '+
                        '   tb_Socio so ON de.Id_Socio = so.Id '
        end
      else
        str_sql := ' WHERE de.nome like '+Quotedstr(edbusca.Text+'%')+' ';
    end;

  DmNpi.QrConsulta.Close;
  DmNpi.QrConsulta.sql.Clear;
  DmNpi.QrConsulta.sql.Add('select '+GAlias+'.* from '+GTabela+GAlias+' ');
  if lInner_sql <> '' then
    DmNpi.QrConsulta.sql.Add(lInner_sql);
  DmNpi.QrConsulta.sql.Add(str_sql);
  DmNpi.QrConsulta.sql.Add(' order by '+GAlias+'.nome ');
  DmNpi.QrConsulta.open;

  EdBusca.SetFocus;
end;

procedure TFCadSocio.BtCancelaClick(Sender: TObject);
begin
  // Limpa os campos Nome e Renda
  EdNome.Text := '';
  EdRenda.Text := '0,00';

  // Se necessário, limpe outros campos também
  EdIdade.Text := '0';
  EdCodSoc.Text := '';
  // Volta para a aba de consulta e esconde a aba de cadastro
  TabConsulta.TabVisible := true;
  TabCadastro.TabVisible := false;
end;


procedure TFCadSocio.BtnAltClick(Sender: TObject);
begin
  TpOper := 2;
  IdPartic := DmNpi.QrConsulta.FieldByName('Id').AsInteger;
  Ednome.Text := DmNpi.QrConsulta.FieldByName('Nome').AsString;
  if GTabela = 'tb_Socio' then
    begin
      Edrenda.Text := DmNpi.QrConsulta.FieldByName('Renda').AsString;
      ChkAtivo.Checked := DmNpi.QrConsulta.FieldByName('Ativo').AsBoolean;
    end
  else
    begin
      EdCodSoc.Text := DmNpi.QrConsulta.FieldByName('Id_Socio').AsString;
      EdIdade.Text := DmNpi.QrConsulta.FieldByName('Idade').AsString;
    end;
  TabConsulta.TabVisible := false;
  TabCadastro.TabVisible := true;
end;

procedure TFCadSocio.BtnExcClick(Sender: TObject);
begin
  if (DmNpi.QrConsulta.RecordCount > 0) and
    (DmNpi.QrConsulta.FieldByName('Id').AsString <> '') then
    begin
      if GTabela = 'tb_Socio' then
        begin
          DmNpi.QrExecuta.Close;
          DmNpi.QrExecuta.sql.Clear;
          DmNpi.QrExecuta.sql.Add('delete from tb_depend where Id_Socio =:IdSocio');
          DmNpi.QrExecuta.Parameters.ParamByName('IdSocio').Value := DmNpi.QrConsulta.FieldByName('Id').AsInteger;
          DmNpi.QrExecuta.Execsql;

          DmNpi.QrExecuta.Close;
          DmNpi.QrExecuta.sql.Clear;
          DmNpi.QrExecuta.sql.Add('delete from tb_Socio where Id =:IdSocio');
          DmNpi.QrExecuta.Parameters.ParamByName('IdSocio').Value := DmNpi.QrConsulta.FieldByName('Id').AsInteger;
          DmNpi.QrExecuta.Execsql;
        end
      else
        begin
          DmNpi.QrExecuta.Close;
          DmNpi.QrExecuta.sql.Clear;
          DmNpi.QrExecuta.sql.Add('delete from tb_Depend where Id =:IdDep');
          DmNpi.QrExecuta.Parameters.ParamByName('IdDep').Value := DmNpi.QrConsulta.FieldByName('Id').AsInteger;
          DmNpi.QrExecuta.Execsql;
        end;
      DmNpi.QrConsulta.Close;
      DmNpi.QrConsulta.open;

      Messagedlg('Registro Removido com sucesso', mtWarning, [mbok], 0);
    end
  else
    Messagedlg('É necessário selecionar um Registro Válido', mtWarning, [mbok], 0);

end;

end.
