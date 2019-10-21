object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'IP Geolocaliza'#231#227'o'
  ClientHeight = 461
  ClientWidth = 684
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  WindowState = wsMaximized
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 60
    Width = 684
    Height = 5
    Align = alTop
    Shape = bsTopLine
    ExplicitTop = 41
    ExplicitWidth = 659
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 684
    Height = 60
    Align = alTop
    BevelOuter = bvNone
    Caption = 'Panel1'
    ShowCaption = False
    TabOrder = 0
    object Label1: TLabel
      Left = 9
      Top = 11
      Width = 12
      Height = 13
      Caption = 'IP'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 232
      Top = 11
      Width = 52
      Height = 13
      Caption = 'Provedor'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtIP: TEdit
      Left = 9
      Top = 30
      Width = 200
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      Text = '8.8.8.8'
    end
    object cbxProvedor: TComboBox
      Left = 232
      Top = 30
      Width = 200
      Height = 24
      Style = csDropDownList
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ItemIndex = 0
      ParentFont = False
      TabOrder = 1
      Items.Strings = (
        ''
        'IP Info'
        'IP Geolocation'
        'IP2Location'
        'IP API'
        'IP Stack'
        'IP Ify')
    end
    object btnLocalizacao: TButton
      Left = 460
      Top = 29
      Width = 100
      Height = 25
      Caption = 'Localiza'#231#227'o'
      TabOrder = 2
      OnClick = btnLocalizacaoClick
    end
    object btnIPExterno: TButton
      Left = 605
      Top = 29
      Width = 100
      Height = 25
      Caption = 'IP Externo'
      TabOrder = 3
      OnClick = btnIPExternoClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 65
    Width = 684
    Height = 396
    Align = alClient
    BevelOuter = bvNone
    Caption = 'Panel2'
    TabOrder = 1
    object Bevel2: TBevel
      Left = 220
      Top = 0
      Width = 5
      Height = 396
      Align = alLeft
      Shape = bsLeftLine
      ExplicitLeft = 209
      ExplicitHeight = 453
    end
    object Bevel3: TBevel
      Left = 525
      Top = 0
      Width = 5
      Height = 396
      Align = alLeft
      Shape = bsLeftLine
      ExplicitLeft = 410
      ExplicitHeight = 383
    end
    object Panel3: TPanel
      Left = 0
      Top = 0
      Width = 220
      Height = 396
      Align = alLeft
      BevelOuter = bvNone
      Caption = 'Panel3'
      TabOrder = 0
      object mmoJSONGeolocalizacao: TMemo
        Left = 0
        Top = 0
        Width = 220
        Height = 396
        Align = alClient
        BevelInner = bvNone
        BorderStyle = bsNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Lines.Strings = (
          '')
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 0
      end
    end
    object Panel4: TPanel
      Left = 225
      Top = 0
      Width = 300
      Height = 396
      Align = alLeft
      BevelOuter = bvNone
      Caption = 'Panel4'
      TabOrder = 1
      object vleJSON: TValueListEditor
        Left = 0
        Top = 0
        Width = 300
        Height = 396
        Align = alClient
        BorderStyle = bsNone
        KeyOptions = [keyEdit, keyUnique]
        Strings.Strings = (
          'IP ='
          'Provider ='
          'HostName ='
          'CountryCode ='
          'CountryCode3 ='
          'CountryName ='
          'CountryFlag ='
          'Region ='
          'City ='
          'ZipCode ='
          'Latitude ='
          'Longitude ='
          'TimeZoneName ='
          'TimeZoneOffset ='
          'ISP =')
        TabOrder = 0
        ColWidths = (
          89
          209)
      end
    end
    object wbrMaps: TWebBrowser
      Left = 530
      Top = 0
      Width = 154
      Height = 396
      Align = alClient
      TabOrder = 2
      ExplicitLeft = 441
      ExplicitTop = 1
      ExplicitWidth = 302
      ExplicitHeight = 383
      ControlData = {
        4C000000EB0F0000EE2800000000000000000000000000000000000000000000
        000000004C000000000000000000000001000000E0D057007335CF11AE690800
        2B2E126208000000000000004C0000000114020000000000C000000000000046
        8000000000000000000000000000000000000000000000000000000000000000
        00000000000000000100000000000000000000000000000000000000}
    end
  end
  object rstClientGetIP: TRESTClient
    BaseURL = 'https://api.ipgeolocation.io/getip'
    Params = <>
    Left = 88
    Top = 63
  end
  object rstRequestGetIP: TRESTRequest
    Client = rstClientGetIP
    Params = <>
    Response = rstResponseGetIP
    SynchronizedEvents = False
    Left = 32
    Top = 119
  end
  object rstResponseGetIP: TRESTResponse
    Left = 120
    Top = 119
  end
end