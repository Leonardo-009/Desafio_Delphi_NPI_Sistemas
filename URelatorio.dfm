object FRelatorio: TFRelatorio
  Left = 0
  Top = 0
  Caption = 'FRelatorio'
  ClientHeight = 632
  ClientWidth = 1235
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object ReportSocios: TRLReport
    Left = 8
    Top = 8
    Width = 794
    Height = 1123
    DataSource = DMNpi.DsRelat
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    object RLBand1: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 51
      BandType = btTitle
      object RLLabel1: TRLLabel
        Left = 248
        Top = 16
        Width = 176
        Height = 22
        Caption = 'Rela'#231#227'o de S'#243'cios'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object RLGroup1: TRLGroup
      Left = 38
      Top = 89
      Width = 718
      Height = 93
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = True
      Borders.DrawRight = False
      Borders.DrawBottom = False
      DataFields = 'IdPai'
      object RLBand2: TRLBand
        Left = 0
        Top = 1
        Width = 718
        Height = 58
        BandType = btHeader
        object RLLabel2: TRLLabel
          Left = 8
          Top = 9
          Width = 54
          Height = 19
          Caption = 'S'#243'cio:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDBText1: TRLDBText
          Left = 76
          Top = 10
          Width = 45
          Height = 16
          AutoSize = False
          DataField = 'IdPai'
          DataSource = DMNpi.DsRelat
          Text = ''
        end
        object RLDBText2: TRLDBText
          Left = 127
          Top = 10
          Width = 482
          Height = 16
          AutoSize = False
          DataField = 'NomePai'
          DataSource = DMNpi.DsRelat
          Text = ''
        end
        object RLLabel3: TRLLabel
          Left = 8
          Top = 36
          Width = 106
          Height = 19
          Caption = 'Dependentes'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object RLBand3: TRLBand
        Left = 0
        Top = 59
        Width = 718
        Height = 23
        object RLDBText3: TRLDBText
          Left = 8
          Top = 2
          Width = 45
          Height = 16
          AutoSize = False
          DataField = 'IdFilho'
          DataSource = DMNpi.DsRelat
          Text = ''
        end
        object RLDBText4: TRLDBText
          Left = 59
          Top = 2
          Width = 482
          Height = 16
          AutoSize = False
          DataField = 'NomeFilho'
          DataSource = DMNpi.DsRelat
          Text = ''
        end
      end
    end
  end
  object RLPDFFilter1: TRLPDFFilter
    DocumentInfo.Creator = 
      'FortesReport Community Edition v4.0.1.2 \251 Copyright '#169' 1999-20' +
      '21 Fortes Inform'#225'tica'
    DisplayName = 'Documento PDF'
    Left = 272
    Top = 256
  end
  object RLRichFilter1: TRLRichFilter
    DisplayName = 'Documento do Word'
    Left = 432
    Top = 272
  end
end
