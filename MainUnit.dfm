object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'File Splitter'
  ClientHeight = 124
  ClientWidth = 444
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  DesignSize = (
    444
    124)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 45
    Top = 11
    Width = 55
    Height = 13
    Caption = 'Original File'
  end
  object SpeedButton1: TSpeedButton
    Left = 413
    Top = 8
    Width = 23
    Height = 22
    Action = BrowseAction
    Anchors = [akTop, akRight]
    Flat = True
  end
  object Label2: TLabel
    Left = 58
    Top = 38
    Width = 42
    Height = 13
    Caption = 'Max Size'
  end
  object Label3: TLabel
    Left = 179
    Top = 38
    Width = 16
    Height = 13
    Caption = 'MiB'
  end
  object Label4: TLabel
    Left = 8
    Top = 65
    Width = 92
    Height = 13
    Caption = 'Output File Pattern'
  end
  object OriginalFileEdit: TEdit
    Left = 106
    Top = 8
    Width = 305
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Text = 'OriginalFileEdit'
  end
  object MaxSizeUpDown: TUpDown
    Left = 158
    Top = 35
    Width = 16
    Height = 21
    Associate = MaxSizeEdit
    Min = 1
    Max = 9999999
    Position = 100
    TabOrder = 1
  end
  object MaxSizeEdit: TEdit
    Left = 106
    Top = 35
    Width = 52
    Height = 21
    NumbersOnly = True
    TabOrder = 2
    Text = '100'
  end
  object OutputFilePattern: TEdit
    Left = 106
    Top = 62
    Width = 305
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 3
    Text = '{FILENAME}.{#}.{EXT}'
  end
  object Button1: TButton
    Left = 336
    Top = 89
    Width = 75
    Height = 25
    Action = SplitAction
    Anchors = [akTop, akRight]
    TabOrder = 4
  end
  object FileOpenDialog1: TFileOpenDialog
    FavoriteLinks = <>
    FileTypes = <>
    Options = []
    Left = 64
    Top = 120
  end
  object ActionList1: TActionList
    Left = 224
    Top = 40
    object BrowseAction: TAction
      Caption = '...'
      OnExecute = BrowseActionExecute
    end
    object SplitAction: TAction
      Caption = '&Split'
      OnExecute = SplitActionExecute
      OnUpdate = SplitActionUpdate
    end
  end
end
