object Form2: TForm2
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Cybe Keyboard'
  ClientHeight = 196
  ClientWidth = 326
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Padding.Left = 5
  Padding.Top = 5
  Padding.Right = 5
  Padding.Bottom = 5
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 16
    Top = 24
    Width = 25
    Height = 13
    Caption = #1055#1086#1088#1090
  end
  object mmoLOG: TMemo
    Left = 5
    Top = 65
    Width = 316
    Height = 126
    Align = alBottom
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 3
    WordWrap = False
  end
  object cbbPort: TComboBox
    Left = 49
    Top = 21
    Width = 80
    Height = 21
    Style = csDropDownList
    ItemIndex = 0
    TabOrder = 2
    Text = 'COM1'
    OnChange = cbbPortChange
    Items.Strings = (
      'COM1'
      'COM2'
      'COM3'
      'COM4'
      'COM5'
      'COM6'
      'COM7'
      'COM8'
      'COM9'
      'COM10'
      'COM11'
      'COM12'
      'COM13'
      'COM14'
      'COM15'
      'COM16'
      'COM17'
      'COM18'
      'COM19'
      'COM20'
      'COM21'
      'COM22'
      'COM23'
      'COM24'
      'COM25'
      'COM26'
      'COM27'
      'COM28'
      'COM29'
      'COM30')
  end
  object btnStart: TButton
    Left = 144
    Top = 19
    Width = 75
    Height = 25
    Caption = #1047#1072#1087#1091#1089#1090#1080#1090#1100
    TabOrder = 0
    OnClick = btnStartClick
  end
  object btnStop: TButton
    Left = 225
    Top = 19
    Width = 75
    Height = 25
    Caption = #1054#1089#1090#1072#1085#1086#1074#1080#1090#1100
    Enabled = False
    TabOrder = 1
    OnClick = btnStopClick
  end
  object tmr: TTimer
    Enabled = False
    Interval = 100
    OnTimer = tmrTimer
    Left = 64
    Top = 64
  end
  object PopupMenu1: TPopupMenu
    Left = 124
    Top = 72
    object N3: TMenuItem
      Caption = #1054#1090#1082#1088#1099#1090#1100' '#1075#1083#1072#1074#1085#1091#1102' '#1092#1086#1088#1084#1091
      ImageIndex = 0
      OnClick = N3Click
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object N1: TMenuItem
      Caption = #1042#1099#1093#1086#1076
      ImageIndex = 3
      OnClick = N1Click
    end
  end
  object TrayIcon: TTrayIcon
    Hint = 'Cube Keyboard'
    BalloonTimeout = 1000
    Icon.Data = {
      0000010001001010000001002000680400001600000028000000100000002000
      0000010020000000000000040000120B0000120B000000000000000000000000
      0000000000000000000000000000023DB953023DB99E0037B7CC0037B7FF0037
      B7FF0037B7CC013AB8A1023DB955000000000000000000000000000000000000
      0000000000000037B71A0340BAF90037B7FF1F87D7FF1F87D7FF1F87D7FF1F87
      D7FF1F87D7FF1F87D7FF0037B7FF0442BBF80037B71000000000000000000000
      00000037B719084BBEFA094DBFFF73BBEEFFFAFFFFFFFFFFFFFFFFFFFFFF0255
      C5FFFFFFFFFFE5ECEFFF77B3E1FF084CBEFF094DBFFA0037B710000000000000
      00000F5FC5E61B7CD3FF0255C5FFD6E6FCFFFFFFFFFFFFFFFFFFFFFFFFFF0255
      C5FFFFFFFFFFFFFFFFFF84A9DAFF0255C5FF1876D1FF1060C792000000000546
      BC3A1C82D5FF84D3F6FFD6E5FBFF1F6ACCFFE1EAF9FFFFFFFFFFFFFFFFFF4281
      D6FFFFFFFFFF75A4E4FF0255C5FFE7E6E6FF95CCE5FF1E84D6CC0647BC461367
      CA8B2AA1E1FFF9FFFFFFFCFCFCFFDFE9F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFE9F4FFFFFFFFFFFFF5F5F4FFE0E2E2FF33A3E1FF146BCC8A1D83
      D5FF59BEEEFFFFFFFFFFFCFCFCFFFEFEFEFFFFFFFFFFF2F7FEFF0255C5FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE1E1E1FF7BC5E9FF1E84D6CC1F87
      D7FF67C5F1FF0255C5FF0255C5FF3075D1FFF0F5FDFF0255C5FF0255C5FF0255
      C5FF5C92DAFF96B6E1FF3577CFFF0255C5FF0255C5FFA9D7EAFF2089D8FF228E
      D9FF67C5F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0255C5FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDCD9FFBADEEDFF228ED9FF2C94
      DCFF4BB8EAFFFFFFFFFFFCFCFCFFFEFEFEFFFFFFFFFFFFFFFFFF306AB7FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDEDEDEFF97D2EAFF2AA1E1FF3487
      D77835AEE6FFE9F9FFFFFCFCFCFF6E9EDFFFFFFFFFFFFFFFFFFF8AA4C9FFFFFF
      FFFFFFFFFFFF85AFE8FFDBEAFFFFEEEEEDFFE0E0E0FF2AA1E1FF3487D7782367
      CB202AA1E1FF63C1EFFF0255C5FF5F94DAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF0255C5FFCFD4DAFFC8DFE6FF2AA1E1FF3775D2420000
      00005FA6E5F02AA1E1FF77C4ECFFF9FAFAFFFFFFFFFFFFFFFFFFFFFFFFFF83AD
      E6FFFFFFFFFFF3F3F3FFCFD5DBFFDEE0E0FF2AA1E1FF5FA6E5F0000000000000
      00002F5CC72387C7F2FD2AA1E1FF68C1ECFFE4EFF2FFEAEAE9FFFFFFFFFF0255
      C5FFA8BCD8FFE2E2E2FFC7DCE4FF2AA1E1FF72B8ECFC2F5CC737000000000000
      0000000000003663C9189ECCF5F52AA1E1FF32ACE5FF68BFE8FF8BBCE1FF236D
      CBFF6BAFE1FF2AA1E1FF2AA1E1FF86BDEFF35F84D74300000000000000000000
      000000000000000000000000000094B8ED528AC0F0F32AA1E1FF2AA1E1FF2AA1
      E1FF2AA1E1FF8AC0F0C294B8ED8100000000000000000000000000000000F00F
      0000C00300008001000080010000000000000000000000000000000000000000
      00000000000000000000000000008001000080010000C0030000F00F0000}
    Icons = ilMinimize
    PopupMenu = PopupMenu1
    Visible = True
    Left = 204
    Top = 56
  end
  object ApplicationEvents: TApplicationEvents
    OnMinimize = ApplicationEventsMinimize
    Left = 60
    Top = 134
  end
  object ilMinimize: TImageList
    Left = 184
    Top = 128
    Bitmap = {
      494C010101000800280010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000565B5C80565B5C80565B5C80565B5C80000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000565B5C80565B5C806BAE94FF6BAE94FF6BAE94FF6BAE94FF565B5C80565B
      5C80000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000565B5C80565B
      5C806BAE94FF6BAE94FF69C3A7FF67E1C2FF6BAE94FF6BAE94FF6BAE94FF6BAE
      94FF565B5C80565B5C8000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000565B5C806BAE94FF6BAE
      94FF69C3A7FF67E1C2FF67E1C2FF67E1C2FF6BAE94FF6BAE94FF6BAE94FF6BAE
      94FF6BAE94FF6BAE94FF565B5C80000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000006BAE94FF69C3A7FF67E1
      C2FF67E1C2FF67E1C2FF67E1C2FF67E1C2FF6BAE94FF6BAE94FF6BAE94FF6BAE
      94FF6BAE94FF6BAE94FF6BAE94FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000006BAE94FF67E1C2FF67E1
      C2FF67E1C2FF67E1C2FF67E1C2FF67E1C2FF6BAE94FF6BAE94FF6BAE94FF6BAE
      94FF6BAE94FF6BAE94FF6BAE94FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000006BAE94FF67E1C2FF67E1
      C2FF67E1C2FF67E1C2FF67E1C2FF67E1C2FF6BAE94FF6BAE94FF6BAE94FF6BAE
      94FF6BAE94FF6BAE94FF6BAE94FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000006BAE94FF67E1C2FF67E1
      C2FF67E1C2FF67E1C2FF67E1C2FF67E1C2FF6BAE94FF6BAE94FF6BAE94FF6BAE
      94FF6BAE94FF6BAE94FF6BAE94FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000006BAE94FF67E1C2FF67E1
      C2FF67E1C2FF67E1C2FFE8F9F5FFBDE8DDFFBDE8DDFFBDE8DDFF6BAE94FF6BAE
      94FF6BAE94FF6BAE94FF6BAE94FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000006BAE94FF67E1C2FF67E1
      C2FFE8F9F5FFE8F9F5FFE8F9F5FFBDE8DDFFBDE8DDFFBDE8DDFFBDE8DDFFBDE8
      DDFF6BAE94FF6BAE94FF6BAE94FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000006BAE94FF9ECDBCFFE8F9
      F5FFE8F9F5FFE8F9F5FFE8F9F5FFBDE8DDFFBDE8DDFFBDE8DDFFBDE8DDFFBDE8
      DDFFBDE8DDFF8DC6B2FF6BAE94FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000006BAE94FF6BAE
      94FF9ECDBCFFE8F9F5FFE8F9F5FFBDE8DDFFBDE8DDFFBDE8DDFFBDE8DDFF8DC6
      B2FF6BAE94FF6BAE94FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00006BAE94FF6BAE94FF9ECDBCFFBDE8DDFFBDE8DDFF8DC6B2FF6BAE94FF6BAE
      94FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000006BAE94FF6BAE94FF6BAE94FF6BAE94FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FFFF000000000000FC3F000000000000
      F00F000000000000C00300000000000080010000000000008001000000000000
      8001000000000000800100000000000080010000000000008001000000000000
      80010000000000008001000000000000C003000000000000F00F000000000000
      FC3F000000000000FFFF00000000000000000000000000000000000000000000
      000000000000}
  end
end
