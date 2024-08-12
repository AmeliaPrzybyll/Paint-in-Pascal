object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 572
  ClientWidth = 810
  Color = clBtnFace
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnClose = FormClose
  OnCreate = FormCreate
  TextHeight = 15
  object Label1: TLabel
    Left = 199
    Top = 486
    Width = 38
    Height = 23
    Caption = 'Tekst'
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Segoe UI Semibold'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 199
    Top = 528
    Width = 90
    Height = 23
    Caption = 'Grubo'#347#263' lini'
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Segoe UI Semibold'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Image1: TImage
    Left = 415
    Top = 335
    Width = 130
    Height = 131
    Stretch = True
  end
  object ScrollBox1: TScrollBox
    Left = 0
    Top = 0
    Width = 809
    Height = 329
    TabOrder = 0
    object PaintBox1: TPaintBox
      Left = -2
      Top = -2
      Width = 105
      Height = 105
      OnMouseDown = PaintBox1MouseDown
      OnMouseMove = PaintBox1MouseMove
      OnMouseUp = PaintBox1MouseUp
      OnPaint = PaintBox1Paint
    end
  end
  object RadioGroup1: TRadioGroup
    Left = 0
    Top = 335
    Width = 193
    Height = 234
    Caption = 'Kszta'#322'ty'
    ItemIndex = 0
    Items.Strings = (
      'Linia'
      'Prostok'#261't'
      'Elipsa'
      'Zaokraglony prostok'#261't'
      'Tekst'
      'Bitmapa'
      'Z wolnej r'#281'ki')
    TabOrder = 1
  end
  object TrackBar1: TTrackBar
    Left = 311
    Top = 515
    Width = 433
    Height = 49
    TabOrder = 2
  end
  object Edit1: TEdit
    Left = 311
    Top = 472
    Width = 433
    Height = 37
    TabOrder = 3
    Text = 'Edit1'
  end
  object RadioGroup2: TRadioGroup
    Left = 199
    Top = 335
    Width = 210
    Height = 106
    Caption = 'Wype'#322'nienie'
    ItemIndex = 0
    Items.Strings = (
      'Pe'#322'ne'
      'Transparentne'
      'Bitmapa'
      'Kratka')
    TabOrder = 4
  end
  object ColorBox1: TColorBox
    Left = 199
    Top = 447
    Width = 210
    Height = 22
    NoneColorColor = clLime
    TabOrder = 5
  end
  object Button1: TButton
    Left = 567
    Top = 354
    Width = 75
    Height = 25
    Caption = 'Kolor pi'#243'ra'
    TabOrder = 6
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 567
    Top = 385
    Width = 75
    Height = 25
    Caption = 'Czcionka'
    TabOrder = 7
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 567
    Top = 416
    Width = 75
    Height = 25
    Caption = 'Bitmapa'
    TabOrder = 8
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 663
    Top = 354
    Width = 75
    Height = 25
    Caption = 'Zapisz obraz'
    TabOrder = 9
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 663
    Top = 385
    Width = 75
    Height = 25
    Caption = 'Wczytaj obraz'
    TabOrder = 10
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 663
    Top = 416
    Width = 75
    Height = 25
    Caption = 'Wyczy'#347#263
    TabOrder = 11
    OnClick = Button6Click
  end
  object SaveDialog1: TSaveDialog
    Left = 224
    Top = 240
  end
  object OpenDialog1: TOpenDialog
    Left = 336
    Top = 264
  end
  object ColorDialog1: TColorDialog
    Left = 40
    Top = 248
  end
  object FontDialog1: TFontDialog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = []
    Left = 128
    Top = 240
  end
end
