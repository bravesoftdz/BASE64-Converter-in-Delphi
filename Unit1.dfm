object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 554
  ClientWidth = 890
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object StaticText1: TStaticText
    Left = 7
    Top = 18
    Width = 86
    Height = 17
    Caption = 'Local do arquivo:'
    TabOrder = 0
  end
  object Button1: TButton
    Left = 523
    Top = 14
    Width = 90
    Height = 45
    Caption = 'Gerar Hash'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 99
    Top = 14
    Width = 382
    Height = 21
    TabOrder = 2
    OnChange = Edit1Change
    OnDblClick = Edit1DblClick
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 80
    Width = 890
    Height = 474
    Align = alBottom
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = 'Hash Base64'
    TabOrder = 3
    ExplicitWidth = 829
    object Memo1: TMemo
      Left = 2
      Top = 15
      Width = 886
      Height = 457
      Align = alClient
      TabOrder = 0
      ExplicitWidth = 825
    end
  end
  object Button2: TButton
    Left = 615
    Top = 14
    Width = 83
    Height = 45
    Caption = 'Gerar Arquivo'
    TabOrder = 4
    OnClick = Button2Click
  end
  object StaticText2: TStaticText
    Left = 8
    Top = 42
    Width = 73
    Height = 17
    Caption = 'Local da hash:'
    TabOrder = 5
  end
  object Edit2: TEdit
    Left = 99
    Top = 38
    Width = 382
    Height = 21
    TabOrder = 6
    OnChange = Edit2Change
    OnDblClick = Edit2DblClick
  end
  object ProgressBar: TProgressBar
    Left = 0
    Top = 63
    Width = 890
    Height = 17
    Align = alBottom
    TabOrder = 7
    ExplicitWidth = 829
  end
  object Button3: TButton
    Left = 700
    Top = 14
    Width = 85
    Height = 45
    Caption = 'Gerar Hashes'
    TabOrder = 8
    OnClick = Button3Click
  end
  object CheckBox1: TCheckBox
    Left = 487
    Top = 28
    Width = 18
    Height = 17
    TabOrder = 9
  end
  object Button4: TButton
    Left = 786
    Top = 14
    Width = 85
    Height = 45
    Caption = 'Gerar Arquivos'
    TabOrder = 10
    OnClick = Button3Click
  end
  object OpenDialog1: TOpenDialog
    Left = 744
    Top = 80
  end
end
