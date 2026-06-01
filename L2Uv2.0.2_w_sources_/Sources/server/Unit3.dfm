object Form3: TForm3
  Left = 344
  Top = 295
  BorderStyle = bsSingle
  Caption = 'Files List Correction [ MuaHAhahaA %) ]'
  ClientHeight = 446
  ClientWidth = 662
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 6
    Top = 388
    Width = 50
    Height = 13
    Caption = 'Revision : '
  end
  object Label2: TLabel
    Left = 4
    Top = 6
    Width = 66
    Height = 13
    Caption = 'Normal Files : '
  end
  object Label3: TLabel
    Left = 350
    Top = 6
    Width = 64
    Height = 13
    Caption = 'Critical Files : '
  end
  object Label4: TLabel
    Left = 4
    Top = 256
    Width = 86
    Height = 13
    Caption = 'Add to Hosts file : '
  end
  object Label5: TLabel
    Left = 284
    Top = 388
    Width = 105
    Height = 13
    Caption = 'Updater .Exe  Name : '
  end
  object Button2: TButton
    Left = 319
    Top = 90
    Width = 23
    Height = 23
    Caption = '>'
    TabOrder = 0
    OnClick = Button2Click
  end
  object Button1: TButton
    Left = 319
    Top = 114
    Width = 23
    Height = 23
    Caption = '<'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button3: TButton
    Left = 506
    Top = 418
    Width = 75
    Height = 25
    Caption = 'Ok'
    TabOrder = 2
    OnClick = Button3Click
  end
  object ValueListEditor1: TValueListEditor
    Left = 2
    Top = 274
    Width = 657
    Height = 106
    Enabled = False
    KeyOptions = [keyEdit, keyAdd, keyDelete]
    TabOrder = 3
    TitleCaptions.Strings = (
      'IP'
      'Host')
    OnDblClick = ValueListEditor1DblClick
    ColWidths = (
      150
      501)
  end
  object CheckBox1: TCheckBox
    Left = 4
    Top = 234
    Width = 97
    Height = 17
    Caption = 'Modify Hosts'
    TabOrder = 4
    OnClick = CheckBox1Click
  end
  object Edit1: TEdit
    Left = 62
    Top = 384
    Width = 121
    Height = 21
    TabOrder = 5
  end
  object ListBox1: TListBox
    Left = 2
    Top = 25
    Width = 310
    Height = 205
    Align = alCustom
    BevelInner = bvLowered
    BiDiMode = bdLeftToRight
    Ctl3D = True
    ItemHeight = 13
    MultiSelect = True
    ParentBiDiMode = False
    ParentCtl3D = False
    TabOrder = 6
    OnKeyDown = ListBox1KeyDown
  end
  object ListBox2: TListBox
    Left = 349
    Top = 24
    Width = 310
    Height = 205
    Align = alCustom
    ItemHeight = 13
    MultiSelect = True
    TabOrder = 7
    OnKeyDown = ListBox2KeyDown
  end
  object Button4: TButton
    Left = 584
    Top = 418
    Width = 75
    Height = 25
    Caption = 'Cancel'
    TabOrder = 8
    OnClick = Button4Click
  end
  object Edit2: TEdit
    Left = 396
    Top = 384
    Width = 187
    Height = 21
    Ctl3D = True
    ParentCtl3D = False
    TabOrder = 9
  end
end
