object FCadDepend: TFCadDepend
  Left = 0
  Top = 0
  Caption = 'Cadastro de dependente'
  ClientHeight = 442
  ClientWidth = 628
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 628
    Height = 442
    ActivePage = TabConsulta
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 624
    ExplicitHeight = 441
    object TabConsulta: TTabSheet
      Caption = 'Consulta'
      object BitBtn1: TBitBtn
        Left = 96
        Top = 344
        Width = 75
        Height = 25
        Caption = 'Incluir'
        TabOrder = 0
        OnClick = BitBtn1Click
      end
      object DBGrid1: TDBGrid
        Left = 20
        Top = 152
        Width = 533
        Height = 120
        DataSource = DMNpi.DsCons
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
      end
      object BitBtn3: TBitBtn
        Left = 192
        Top = 344
        Width = 75
        Height = 25
        Caption = 'Alterar'
        TabOrder = 2
        OnClick = BitBtn3Click
      end
      object BitBtn4: TBitBtn
        Left = 297
        Top = 344
        Width = 75
        Height = 25
        Caption = 'Excluir'
        TabOrder = 3
      end
    end
    object TabCadastro: TTabSheet
      Caption = 'Cadastro'
      ImageIndex = 1
      object Label1: TLabel
        Left = 16
        Top = 72
        Width = 33
        Height = 15
        Caption = 'Nome'
      end
      object BitBtn2: TBitBtn
        Left = 88
        Top = 352
        Width = 75
        Height = 25
        Caption = 'Confirmar'
        TabOrder = 0
        OnClick = BitBtn2Click
      end
      object EdNome: TEdit
        Left = 16
        Top = 93
        Width = 283
        Height = 23
        MaxLength = 50
        TabOrder = 1
      end
    end
  end
end
