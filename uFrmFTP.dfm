object frmFTP: TfrmFTP
  Left = 368
  Top = 159
  BorderStyle = bsSingle
  Caption = 'FTP'
  ClientHeight = 498
  ClientWidth = 426
  Color = clWindow
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlButtons: TPanel
    Left = 0
    Top = 0
    Width = 426
    Height = 30
    Align = alTop
    BevelOuter = bvNone
    Color = clBlack
    ParentBackground = False
    TabOrder = 0
    object btnExit: TSpeedButton
      AlignWithMargins = True
      Left = 354
      Top = 3
      Width = 69
      Height = 24
      Align = alRight
      Caption = 'Exit'
      OnClick = btnExitClick
      ExplicitLeft = 3
      ExplicitTop = 6
    end
    object btnFtpDisconnect: TSpeedButton
      AlignWithMargins = True
      Left = 153
      Top = 3
      Width = 69
      Height = 24
      Align = alLeft
      Caption = 'Disconnect'
      OnClick = btnFtpDisconnectClick
      ExplicitLeft = 3
      ExplicitTop = 6
    end
    object btnFtpConnect: TSpeedButton
      AlignWithMargins = True
      Left = 78
      Top = 3
      Width = 69
      Height = 24
      Align = alLeft
      Caption = 'Connect'
      OnClick = btnFtpConnectClick
      ExplicitTop = 6
    end
    object btnFtpTest: TSpeedButton
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 69
      Height = 24
      Align = alLeft
      Caption = 'Test'
      OnClick = btnFtpTestClick
      ExplicitTop = 6
    end
  end
  object pnlStatusBar: TPanel
    Left = 0
    Top = 449
    Width = 426
    Height = 30
    Align = alBottom
    BevelOuter = bvNone
    Color = clWindow
    ParentBackground = False
    TabOrder = 5
    object lblSizeTransfered: TLabel
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 420
      Height = 14
      Align = alClient
      ExplicitWidth = 3
      ExplicitHeight = 13
    end
    object pbStatus: TProgressBar
      Left = 0
      Top = 20
      Width = 426
      Height = 10
      Align = alBottom
      State = pbsPaused
      TabOrder = 0
    end
  end
  object pnlMain: TPanel
    Left = 0
    Top = 30
    Width = 426
    Height = 133
    Align = alClient
    BevelOuter = bvNone
    Color = clWindow
    ParentBackground = False
    TabOrder = 1
    object lblHost: TLabel
      Left = 48
      Top = 6
      Width = 24
      Height = 13
      Caption = 'Host'
      FocusControl = edtHost
    end
    object lblPort: TLabel
      Left = 334
      Top = 6
      Width = 21
      Height = 13
      Caption = 'Port'
      FocusControl = edtPort
    end
    object lblUsername: TLabel
      Left = 48
      Top = 49
      Width = 51
      Height = 13
      Caption = 'Username'
      FocusControl = edtUsername
    end
    object lblPassword: TLabel
      Left = 219
      Top = 49
      Width = 49
      Height = 13
      Caption = 'Password'
      FocusControl = edtPassword
    end
    object edtHost: TEdit
      Tag = 1
      Left = 48
      Top = 22
      Width = 280
      Height = 21
      TabOrder = 0
      OnEnter = edtHostEnter
      OnExit = edtHostExit
    end
    object edtPort: TEdit
      Tag = 1
      Left = 334
      Top = 22
      Width = 50
      Height = 21
      MaxLength = 6
      NumbersOnly = True
      TabOrder = 1
      Text = '21'
      OnEnter = edtPortEnter
      OnExit = edtHostExit
    end
    object edtUsername: TEdit
      Tag = 1
      Left = 48
      Top = 65
      Width = 165
      Height = 21
      TabOrder = 2
      OnEnter = edtUsernameEnter
      OnExit = edtHostExit
    end
    object edtPassword: TEdit
      Tag = 1
      Left = 219
      Top = 65
      Width = 165
      Height = 21
      PasswordChar = '*'
      TabOrder = 3
      OnEnter = edtPasswordEnter
      OnExit = edtHostExit
    end
    object ckbProxy: TCheckBox
      Left = 48
      Top = 115
      Width = 97
      Height = 17
      Caption = 'Proxy'
      TabOrder = 5
      OnClick = ckbProxyClick
      OnEnter = ckbProxyEnter
      OnExit = edtHostExit
    end
    object ckbPassive: TCheckBox
      Left = 48
      Top = 92
      Width = 97
      Height = 17
      Caption = 'Passive'
      Checked = True
      State = cbChecked
      TabOrder = 4
    end
  end
  object StbConect: TStatusBar
    Left = 0
    Top = 479
    Width = 426
    Height = 19
    Color = clWindow
    Panels = <
      item
        Width = 270
      end
      item
        Text = 'State: Discconnected'
        Width = 50
      end>
  end
  object pnlView: TPanel
    Left = 0
    Top = 344
    Width = 426
    Height = 105
    Align = alBottom
    BevelOuter = bvNone
    Color = clWindow
    ParentBackground = False
    TabOrder = 4
    object pnlButtonsFTP: TPanel
      Left = 0
      Top = 0
      Width = 426
      Height = 22
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object btnSendFile: TSpeedButton
        Left = 0
        Top = 0
        Width = 57
        Height = 22
        Align = alLeft
        Caption = 'Send File'
        OnClick = btnSendFileClick
      end
      object btnGetFile: TSpeedButton
        Left = 57
        Top = 0
        Width = 57
        Height = 22
        Align = alLeft
        Caption = 'Get File'
        Visible = False
        OnClick = btnGetFileClick
        ExplicitLeft = 0
      end
      object btnClearLog: TSpeedButton
        Left = 369
        Top = 0
        Width = 57
        Height = 22
        Align = alRight
        Caption = 'Clear'
        OnClick = btnClearLogClick
        ExplicitLeft = 0
      end
    end
    object mmLog: TMemo
      Left = 0
      Top = 22
      Width = 426
      Height = 83
      Align = alClient
      BevelInner = bvNone
      BevelOuter = bvNone
      Enabled = False
      TabOrder = 1
    end
  end
  object pnlPaths: TPanel
    Left = 0
    Top = 258
    Width = 426
    Height = 86
    Align = alBottom
    BevelOuter = bvNone
    Color = clWindow
    ParentBackground = False
    TabOrder = 3
    object lblFilePath: TLabel
      Left = 48
      Top = 1
      Width = 44
      Height = 13
      Caption = 'File Path'
      FocusControl = edtFilePath
    end
    object btnFindFile: TSpeedButton
      Left = 390
      Top = 14
      Width = 28
      Height = 28
      Flat = True
      Glyph.Data = {
        B60D0000424DB60D000000000000360000002800000030000000180000000100
        180000000000800D000000000000000000000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCCD2E2B9BDCFD8D1D7FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE7E7
        E7DBDBDBE7E7E7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFC8D0E1285A9F2B5899626F8DABA2AEFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFE5E5E59B9B9B9797979D9D9DC8C8C8FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC8D1E3285EA55BD3F977DBF426589F70
        7B9BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE6E6E69B9B9BADAD
        ADB0B0B0979797ABABABFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC8D2E5
        2963AC5BD5FA7EE3FA45AFF11879DE255099FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFE6E6E69D9D9DAEAEAEB2B2B2A8A8A89E9E9E9A9A9AFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFC9D4E72967B45CD5FA7FE3FA45AFF1177FE41F5AADC9
        D4E5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE6E6E69E9E9EAEAEAEB2B2B2A8A8
        A89F9F9F9B9B9BE6E6E6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC9D5E9296CBA5CD5FC
        7FE3FA44AFF1177FE41F5EB6C9D5E9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE7
        E7E79F9F9FAEAEAEB2B2B2A8A8A89F9F9F9C9C9CE7E7E7FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFC9D6EA2971C15CD5FC7EE3FA44AFF1177FE41F63BDC9D6EAFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFE7E7E7A0A0A0AEAEAEB2B2B2A8A8A89F9F9F9D9D
        9DE7E7E7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F6F7E7
        E5E6E6E5E6F4F3F3FFFFFFFFFFFFFFFFFFFFFFFF447DC551C3F47EE3FA44AFEF
        177FE41F67C3C9D8ECFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFAFAFAF1F1F1F1F1F1F8F8F8FFFFFFFFFFFFFFFFFFFFFFFFADADADAB
        ABABB2B2B2A8A8A89F9F9F9E9E9EE7E7E7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFDFCFCB6B2B66A636C483F48564950534952453B455C545CA8A3A8F7F7
        F7EFEDF1B4C2D52E79C83DA2E91780E41F6CC8C9D9EDFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFEFEFED5D5D5A9A9A9929292939393939393909090
        A2A2A2CDCDCDFAFAFAF4F4F4CECECE9E9E9EA6A6A69F9F9F9F9F9FE7E7E7FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEEEF6C646E66574AAD9D6FFBDCACFF
        E6C4FFEECDFFF5CCC0C8A6606263483C4871647F9CA1B691A9BC2372CB1F70D2
        C9DBF1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5F5F5A8A8A89595
        95A4A4A4B5B5B5B8B8B8BABABABABABAAEAEAE989898949494A0A0A0A9A9A9A9
        A9A99D9D9DA0A0A0E8E8E8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEEEF
        5D56618E7753F2C18FFFCFA9FFD6B3FFE6C9FFEDD0FFF2D3FFF8D8FFFCDF97AC
        A6453B45726374C8C1CBE0EEFAD4E3F5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFF5F5F59E9E9E9C9C9CB0B0B0B4B4B4B6B6B6B9B9B9BABABABBBBBB
        BBBBBBBCBCBCA8A8A89090909B9B9BD5D5D5F2F2F2EDEDEDFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFF7A737E8D734FEAB486F5BC91F6BD91FFD8B6FF
        E8CDFFEED2FFF3D7FFF9E0FFFDE9FFFEF095AEAD463C49CDC9CDFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAEAEAE9B9B9BADADADB0B0
        B0B0B0B0B6B6B6B9B9B9BABABABBBBBBBCBCBCBDBDBDBEBEBEA9A9A9909090DF
        DFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC9C6CB6F5C51
        DAA574EDB489E2A97EF8BF93FFDAB9FFE7CDFFEED5FFF4DAFFF9E3FFFDEFFFFE
        F7FFFEEE6B7175A5A1A7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFDEDEDE979797A9A9A9AEAEAEABABABB0B0B0B6B6B6B9B9B9BABABABBBBBB
        BCBCBCBEBEBEBFBFBFBEBEBE9C9C9CCBCBCBFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF8F8792A07F52E1A87DDBA277DDA479F6BD92FFD7B5FF
        E7CEFFEDD4FFF2DAFFF7E1FFFAE7FFFDEDFFFCE7CCD6C05D555FFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB7B7B79E9E9EABABABA9A9A9AAAA
        AAB0B0B0B6B6B6B9B9B9BABABABBBBBBBCBCBCBDBDBDBEBEBEBDBDBDB2B2B29F
        9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF706471C4905D
        DDA479D39A6FF8BF94FFD0ACFFDABCFFEBD8FFEBD4FFEED7FFF4DDFFF7E1FFF8
        E1FFF9DEFFFAD75D525FF0F0F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF9F9F9FA4A4A4AAAAAAA7A7A7B0B0B0B4B4B4B7B7B7BABABABABABABBBBBB
        BCBCBCBCBCBCBCBCBCBCBCBCBCBCBC969696F7F7F7FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF7C6A78C0895BDAA176EFB68BDAA176E5AC81FDC498FF
        DCBDFFEFE0FFECD5FFEED6FFF2DAFFF4DAFFF3D8FFF2CF7D7179D6D5D8FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9D9D9DA3A3A3A9A9A9AEAEAEA9A9
        A9ACACACB2B2B2B7B7B7BBBBBBBABABABABABABBBBBBBBBBBBBBBBBBBABABA9D
        9D9DE7E7E7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7E7181BE8759
        D89F74E4AB80FFCCA5FFE1CBFFDBBFFFCCA4FFDFC3FFECDBFFE9D1FFECD3FFED
        D3FFEDD1FFEFCE7F767BDAD8DBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF9E9E9EA2A2A2A8A8A8ABABABB4B4B4B8B8B8B7B7B7B3B3B3B8B8B8BBBBBB
        BABABABABABABABABABABABABABABA9E9E9EE9E9E9FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF827788BF8857D0976CF3BA8FFFE1CBFFEEE2FFF9F5FF
        DABDFFCBA3FFE6D1FFE4CBFFE5CBFFE7CDFFE7CCFFECC26A5E6BF1F1F2FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA5A5A5A2A2A2A6A6A6AFAFAFB8B8
        B8BBBBBBBEBEBEB7B7B7B3B3B3B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B999
        9999F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA8A0ACA68053
        CB9267EBB287FFD9BBFFEADAFFF1E7FFDEC5F1B88DFFDBBFFFCCA3FED3AEFFD8
        B6FFDDC0D3C594796F7CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFC0C0C09F9F9FA5A5A5ADADADB6B6B6BABABABCBCBCB8B8B8AFAFAFB7B7B7
        B3B3B3B5B5B5B6B6B6B7B7B7AEAEAEA9A9A9FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFDFDCE08B776FBF8656D9A075FCC398FFDCC2FFE5D2FF
        CCA5FBC297FCC398ECB388F3BA8EFFC99EFCD1A08C8171BCB8BEFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE7E7E79E9E9EA2A2A2A9A9A9B1B1
        B1B7B7B7B9B9B9B4B4B4B1B1B1B1B1B1ADADADAFAFAFB3B3B3B3B3B39F9F9FD4
        D4D4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFABA4AF
        9D7E5CC0885CDBA277EEB58AFBC297F6BD92EEB58AD1986DDDA479F1B88DF4BE
        91B09F77847A89FCFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFBFBFBF9F9F9FA3A3A3A9A9A9AEAEAEB1B1B1B0B0B0AEAEAEA7A7A7
        AAAAAAAFAFAFB0B0B0A5A5A5ADADADFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFAFAFA9C929FA0825FBF8857CD9469D69D72DD
        A479DBA277E3AA7FEAB186DFAC7BAB976F857988E9E8EBFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBB0B0B0A0A0A0A2A2
        A2A6A6A6A8A8A8AAAAAAA9A9A9ABABABADADADABABABA4A4A4A7A7A7F1F1F1FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FAFAFAB2ABB598867DAD875AC38C5BBC8558C28B5DCF9967BA9668958475968F
        9BEDECEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFBFBFBC1C1C1A2A2A2A1A1A1A3A3A3A2A2A2A3A3A3A6A6A6
        A4A4A4A1A1A1B3B3B3F3F3F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE4E0E4B7AFBA9D91A09F
        919DA1939D968B9BA69FABD7D3D8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE8E8
        E8C4C4C4ACACACA6A6A6A6A6A6A9A9A9BBBBBBE1E1E1FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      NumGlyphs = 2
      OnClick = btnFindFileClick
    end
    object lblFTPPath: TLabel
      Left = 48
      Top = 44
      Width = 43
      Height = 13
      Caption = 'FTP Path'
      FocusControl = edtFTPPath
    end
    object edtFilePath: TEdit
      Left = 48
      Top = 17
      Width = 336
      Height = 21
      TabOrder = 0
      OnEnter = edtFilePathEnter
      OnExit = edtHostExit
    end
    object edtFTPPath: TEdit
      Left = 48
      Top = 60
      Width = 336
      Height = 21
      TabOrder = 1
      OnEnter = edtFTPPathEnter
      OnExit = edtHostExit
    end
  end
  object pnlProxy: TPanel
    Left = 0
    Top = 163
    Width = 426
    Height = 95
    Align = alBottom
    BevelKind = bkTile
    BevelOuter = bvNone
    Color = clWindow
    Enabled = False
    FullRepaint = False
    ParentBackground = False
    TabOrder = 2
    object lblProxyHost: TLabel
      Left = 46
      Top = 6
      Width = 54
      Height = 13
      Caption = 'Host Proxy'
      FocusControl = edtHostProxy
    end
    object lblProxyPort: TLabel
      Left = 332
      Top = 6
      Width = 51
      Height = 13
      Caption = 'Port Proxy'
      FocusControl = edtPortProxy
    end
    object lblProxyUsername: TLabel
      Left = 46
      Top = 49
      Width = 81
      Height = 13
      Caption = 'Username Proxy'
      FocusControl = edtUsernameProxy
    end
    object lblProxyPassword: TLabel
      Left = 217
      Top = 49
      Width = 79
      Height = 13
      Caption = 'Password Proxy'
      FocusControl = edtPasswordProxy
    end
    object edtHostProxy: TEdit
      Tag = 1
      Left = 46
      Top = 22
      Width = 280
      Height = 21
      TabOrder = 0
      OnEnter = edtHostProxyEnter
      OnExit = edtHostExit
    end
    object edtPortProxy: TEdit
      Tag = 1
      Left = 332
      Top = 22
      Width = 50
      Height = 21
      MaxLength = 5
      NumbersOnly = True
      TabOrder = 1
      OnEnter = edtPortProxyEnter
      OnExit = edtHostExit
    end
    object edtUsernameProxy: TEdit
      Tag = 1
      Left = 46
      Top = 65
      Width = 165
      Height = 21
      TabOrder = 2
      OnEnter = edtUsernameProxyEnter
      OnExit = edtHostExit
    end
    object edtPasswordProxy: TEdit
      Tag = 1
      Left = 217
      Top = 65
      Width = 165
      Height = 21
      PasswordChar = '*'
      TabOrder = 3
      OnEnter = edtPasswordProxyEnter
      OnExit = edtHostExit
    end
  end
end
