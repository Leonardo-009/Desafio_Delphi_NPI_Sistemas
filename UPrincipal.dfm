object FPrincipal: TFPrincipal
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Projeto NPI'
  ClientHeight = 442
  ClientWidth = 628
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -48
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesktopCenter
  OnCreate = FormCreate
  TextHeight = 65
  object Label1: TLabel
    Left = 144
    Top = 32
    Width = 232
    Height = 75
    Caption = 'Desafio'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -64
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    StyleElements = []
  end
  object Label2: TLabel
    Left = 382
    Top = 32
    Width = 107
    Height = 75
    Caption = 'NPI'
    Font.Charset = ANSI_CHARSET
    Font.Color = clRed
    Font.Height = -64
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    StyleElements = []
  end
  object BtnSocio: TBitBtn
    Left = 144
    Top = 136
    Width = 313
    Height = 97
    Caption = 'S'#243'cios'
    TabOrder = 0
    OnClick = BtnSocioClick
  end
  object BtnDepend: TBitBtn
    Left = 144
    Top = 288
    Width = 313
    Height = 97
    Caption = 'Dependentes'
    TabOrder = 1
    OnClick = BtnDependClick
  end
end
