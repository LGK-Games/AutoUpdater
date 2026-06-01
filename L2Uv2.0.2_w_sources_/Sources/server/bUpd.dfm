object Form1: TForm1
  Left = 419
  Top = 377
  BorderStyle = bsToolWindow
  Caption = ' uBuilder v0.98b'
  ClientHeight = 126
  ClientWidth = 332
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel
    Left = 6
    Top = 107
    Width = 114
    Height = 13
    Cursor = crHandPoint
    Caption = 'http://www.l2storm.com'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsUnderline]
    ParentFont = False
    OnClick = Label3Click
  end
  object Label1: TLabel
    Left = 4
    Top = 7
    Width = 57
    Height = 13
    Caption = 'Source dir : '
    OnClick = Label1Click
  end
  object Label2: TLabel
    Left = 5
    Top = 30
    Width = 55
    Height = 13
    Caption = 'Output dir : '
  end
  object Label4: TLabel
    Left = 5
    Top = 55
    Width = 54
    Height = 13
    Caption = '#Revision :'
  end
  object Gauge1: TGauge
    Left = 4
    Top = 106
    Width = 242
    Height = 15
    BackColor = clBtnFace
    Color = clBlue
    ForeColor = clRed
    ParentColor = False
    Progress = 0
    ShowText = False
    Visible = False
  end
  object Gauge2: TGauge
    Left = 4
    Top = 92
    Width = 242
    Height = 12
    BackColor = clBtnFace
    Color = clBlue
    ForeColor = clRed
    ParentColor = False
    Progress = 0
    ShowText = False
    Visible = False
  end
  object Bevel1: TBevel
    Left = 4
    Top = 82
    Width = 323
    Height = 15
    Shape = bsTopLine
    Style = bsRaised
  end
  object Edit1: TEdit
    Left = 62
    Top = 4
    Width = 241
    Height = 21
    Color = clBtnFace
    Ctl3D = True
    ParentCtl3D = False
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 62
    Top = 28
    Width = 241
    Height = 21
    Color = clBtnFace
    Ctl3D = True
    ParentCtl3D = False
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 1
  end
  object Button1: TButton
    Left = 306
    Top = 4
    Width = 23
    Height = 19
    Caption = '...'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 306
    Top = 28
    Width = 23
    Height = 19
    Caption = '...'
    TabOrder = 3
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 251
    Top = 92
    Width = 75
    Height = 29
    Caption = 'Build !'
    TabOrder = 4
    OnClick = Button3Click
  end
  object CheckBox1: TCheckBox
    Left = 146
    Top = 55
    Width = 141
    Height = 17
    Caption = 'Revision autoincrement'
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 5
    OnClick = CheckBox1Click
  end
  object Edit3: TEdit
    Left = 62
    Top = 52
    Width = 79
    Height = 21
    Ctl3D = True
    ParentCtl3D = False
    TabOrder = 6
    Text = '0'
  end
  object MainMenu1: TMainMenu
    Left = 332
    Top = 4
    object File1: TMenuItem
      Caption = 'File'
      object About1: TMenuItem
        Caption = 'About'
        OnClick = About1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Exit1: TMenuItem
        Caption = 'Exit'
        OnClick = Exit1Click
      end
    end
  end
end
