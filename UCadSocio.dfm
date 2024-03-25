object FCadSocio: TFCadSocio
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Cadastro de S'#243'cios'
  ClientHeight = 496
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesktopCenter
  OnShow = FormShow
  TextHeight = 15
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 635
    Height = 496
    ActivePage = TabConsulta
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 631
    ExplicitHeight = 495
    object TabConsulta: TTabSheet
      Caption = 'Consulta'
      object PnTopo: TPanel
        Left = 0
        Top = 0
        Width = 627
        Height = 66
        Align = alTop
        TabOrder = 0
        ExplicitWidth = 623
        object Label4: TLabel
          Left = 14
          Top = 5
          Width = 46
          Height = 15
          Caption = 'Pesquisa'
        end
        object EdBusca: TEdit
          Left = 14
          Top = 26
          Width = 243
          Height = 23
          TabOrder = 0
        end
        object RgPart: TRadioGroup
          Left = 281
          Top = 5
          Width = 242
          Height = 44
          Caption = 'Participante'
          Columns = 2
          ItemIndex = 0
          Items.Strings = (
            'S'#243'cio'
            'Dependente')
          TabOrder = 1
        end
        object BitBtn5: TButton
          Left = 540
          Top = 26
          Width = 74
          Height = 23
          Caption = 'Pesquisar'
          TabOrder = 2
          OnClick = BitBtn5Click
        end
      end
      object PnMeio: TPanel
        Left = 0
        Top = 66
        Width = 627
        Height = 326
        Align = alClient
        TabOrder = 1
        ExplicitWidth = 623
        ExplicitHeight = 325
        object DBGrid1: TDBGrid
          Left = 1
          Top = 1
          Width = 625
          Height = 324
          Align = alClient
          DataSource = DMNpi.DsCons
          Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = 'Segoe UI'
          TitleFont.Style = []
          OnDrawColumnCell = DBGrid1DrawColumnCell
        end
      end
      object PnRodape: TPanel
        Left = 0
        Top = 392
        Width = 627
        Height = 74
        Align = alBottom
        TabOrder = 2
        ExplicitTop = 391
        ExplicitWidth = 623
        object BtnInc: TBitBtn
          Tag = 1
          Left = 51
          Top = 22
          Width = 75
          Height = 25
          Caption = 'Incluir'
          TabOrder = 0
          OnClick = BtnIncClick
        end
        object BtnAlt: TBitBtn
          Tag = 2
          Left = 196
          Top = 22
          Width = 75
          Height = 25
          Caption = 'Alterar'
          TabOrder = 1
          OnClick = BtnAltClick
        end
        object BtnExc: TBitBtn
          Tag = 3
          Left = 339
          Top = 22
          Width = 75
          Height = 25
          Caption = 'Excluir'
          TabOrder = 2
          OnClick = BtnExcClick
        end
        object BtnRel: TButton
          Tag = 4
          Left = 472
          Top = 22
          Width = 75
          Height = 25
          Caption = 'Relat'#243'rios'
          TabOrder = 3
          OnClick = BtnRelClick
        end
      end
    end
    object TabCadastro: TTabSheet
      Caption = 'Cadastro'
      ImageIndex = 1
      object Label1: TLabel
        Left = 13
        Top = 79
        Width = 33
        Height = 15
        Caption = 'Nome'
      end
      object LbIdade: TLabel
        Left = 325
        Top = 79
        Width = 29
        Height = 15
        Caption = 'Idade'
      end
      object LbRenda: TLabel
        Left = 13
        Top = 143
        Width = 33
        Height = 15
        Caption = 'Renda'
      end
      object LbCodSoc: TLabel
        Left = 13
        Top = 17
        Width = 88
        Height = 15
        Caption = 'C'#243'digo do S'#243'cio'
      end
      object LbNomSoc: TLabel
        Left = 97
        Top = 43
        Width = 341
        Height = 15
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        StyleElements = []
      end
      object EdNome: TEdit
        Left = 13
        Top = 100
        Width = 283
        Height = 23
        MaxLength = 50
        TabOrder = 1
      end
      object EdIdade: TEdit
        Left = 325
        Top = 100
        Width = 49
        Height = 23
        MaxLength = 3
        NumbersOnly = True
        TabOrder = 2
        Text = '0'
      end
      object ChkAtivo: TCheckBox
        Left = 149
        Top = 167
        Width = 97
        Height = 17
        Caption = 'Ativo'
        TabOrder = 4
      end
      object EdRenda: TEdit
        Left = 13
        Top = 164
        Width = 105
        Height = 23
        TabOrder = 3
        Text = '0,00'
        OnKeyPress = EdRendaKeyPress
      end
      object EdCodSoc: TEdit
        Left = 13
        Top = 38
        Width = 65
        Height = 23
        MaxLength = 6
        NumbersOnly = True
        TabOrder = 0
        Text = '0'
      end
      object BitBtn1: TBitBtn
        Left = 160
        Top = 272
        Width = 109
        Height = 49
        Caption = 'Confirmar'
        TabOrder = 5
        OnClick = BitBtn1Click
      end
      object BtCancela: TBitBtn
        Left = 288
        Top = 272
        Width = 113
        Height = 49
        Caption = 'Cancelar'
        TabOrder = 6
        OnClick = BtCancelaClick
      end
    end
  end
end
