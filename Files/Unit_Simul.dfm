object Form_Simul: TForm_Simul
  Left = 495
  Top = 325
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Form_Simul'
  ClientHeight = 152
  ClientWidth = 513
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poDesigned
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object SG_Fit_Table: TStringGrid
    Left = 0
    Top = 65
    Width = 513
    Height = 87
    Align = alClient
    ColCount = 8
    DefaultColWidth = 60
    DefaultRowHeight = 18
    DrawingStyle = gdsGradient
    RowCount = 4
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
    TabOrder = 0
    OnDrawCell = SG_Fit_TableDrawCell
    OnMouseWheelDown = SG_Fit_TableMouseWheelDown
    OnMouseWheelUp = SG_Fit_TableMouseWheelUp
    ColWidths = (
      60
      60
      60
      60
      60
      60
      60
      60)
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 513
    Height = 65
    Align = alTop
    TabOrder = 1
    object Label1: TLabel
      Left = 5
      Top = 13
      Width = 75
      Height = 13
      Caption = 'No gauss peaks'
      Visible = False
    end
    object Label2: TLabel
      Left = 4
      Top = 49
      Width = 218
      Height = 13
      Caption = 'Scroll mouse wheel in cell to change the value'
    end
    object SpeedButton1: TSpeedButton
      Left = 8
      Top = 6
      Width = 50
      Height = 20
      Caption = 'Simulate'
      Visible = False
      OnClick = SpeedButton1Click
    end
    object SpeedButton2: TSpeedButton
      Left = 359
      Top = 46
      Width = 50
      Height = 20
      Visible = False
      OnClick = SpeedButton2Click
    end
    object SpeedButton3: TSpeedButton
      Left = 8
      Top = 15
      Width = 89
      Height = 25
      Caption = 'Copy G-curves'
      OnClick = SpeedButton3Click
    end
    object Blink: TVrBlinkLed
      Left = 226
      Top = 51
      Width = 113
      Height = 12
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Palette1.Low = clBtnFace
      Palette1.High = clRed
      Palette2.Low = clBlack
      Palette2.High = clAqua
      Palette3.Low = clBlack
      Palette3.High = clYellow
      Palette4.Low = clBlack
      Palette4.High = clLime
      BlinkLedType = ltLargeRect
      Margin = 0
      Spacing = 0
      Color = clLime
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Visible = False
      BlinkSpeed = 500
    end
    object SpinEdit1: TSpinEdit
      Left = 103
      Top = 8
      Width = 41
      Height = 22
      MaxValue = 6
      MinValue = 0
      TabOrder = 0
      Value = 0
      Visible = False
      OnChange = SpinEdit1Change
    end
    object CheckBox1: TCheckBox
      Left = 113
      Top = 36
      Width = 81
      Height = 17
      Caption = 'Add noise'
      TabOrder = 1
      Visible = False
    end
    object CB_Fix_Width: TCheckBox
      Left = 394
      Top = 35
      Width = 97
      Height = 17
      Caption = 'Fix width of peak'
      TabOrder = 2
    end
    object CB_Fix_Pos: TCheckBox
      Left = 394
      Top = 8
      Width = 113
      Height = 17
      Caption = 'Fix position of peak'
      TabOrder = 3
    end
    object Button1: TButton
      Left = 415
      Top = 54
      Width = 74
      Height = 17
      Caption = 'Save Curves'
      TabOrder = 4
      Visible = False
      OnClick = Button1Click
    end
    object LabeledEdit19: TLabeledEdit
      Left = 341
      Top = 33
      Width = 26
      Height = 21
      EditLabel.Width = 100
      EditLabel.Height = 13
      EditLabel.Caption = 'Max peak width (nm)'
      LabelPosition = lpLeft
      TabOrder = 5
      Text = '60'
    end
    object LabeledEdit18: TLabeledEdit
      Left = 341
      Top = 6
      Width = 26
      Height = 21
      EditLabel.Width = 149
      EditLabel.Height = 13
      EditLabel.Caption = 'Max peak position change (nm)'
      LabelPosition = lpLeft
      TabOrder = 6
      Text = '40'
    end
  end
  object StringGrid1: TStringGrid
    Left = 22
    Top = 77
    Width = 483
    Height = 50
    ColCount = 9
    DefaultColWidth = 60
    DefaultRowHeight = 18
    RowCount = 4
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
    TabOrder = 2
    Visible = False
    OnMouseWheelDown = SG_Fit_TableMouseWheelDown
    OnMouseWheelUp = SG_Fit_TableMouseWheelUp
  end
end
