object frmCadastroBase: TfrmCadastroBase
  Left = 0
  Top = 0
  Caption = 'Cadastro Base'
  ClientHeight = 392
  ClientWidth = 616
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 120
  TextHeight = 16
  object pnlDados: TPanel
    Left = 0
    Top = 0
    Width = 452
    Height = 392
    Align = alClient
    BevelOuter = bvNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object lblRegistros: TLabel
      Left = 8
      Top = 116
      Width = 70
      Height = 21
      Caption = 'Registros'
    end
    object grdRegistros: TStringGrid
      AlignWithMargins = True
      Left = 8
      Top = 140
      Width = 436
      Height = 215
      Margins.Left = 8
      Margins.Top = 8
      Margins.Right = 8
      Margins.Bottom = 8
      Align = alBottom
      ColCount = 3
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goFixedRowDefAlign]
      TabOrder = 0
      ColWidths = (
        14
        77
        348)
      RowHeights = (
        24
        24
        24
        24
        24)
    end
    object pnlNav: TPanel
      Left = 0
      Top = 363
      Width = 452
      Height = 29
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 1
      object btnAvancar: TButton
        Left = 416
        Top = 0
        Width = 28
        Height = 25
        Caption = '>'
        TabOrder = 0
        OnClick = btnAvancarClick
      end
      object btnRetroceder: TButton
        Left = 308
        Top = 0
        Width = 28
        Height = 25
        Caption = '<'
        TabOrder = 1
        OnClick = btnRetrocederClick
      end
      object txtPagNav: TStaticText
        Left = 336
        Top = 2
        Width = 81
        Height = 25
        Alignment = taCenter
        AutoSize = False
        Caption = '999/999'
        TabOrder = 2
      end
    end
  end
  object pnlBotoes: TPanel
    Left = 452
    Top = 0
    Width = 164
    Height = 392
    Align = alRight
    BevelEdges = [beLeft]
    BevelKind = bkTile
    BevelOuter = bvNone
    TabOrder = 1
    object btnIncluir: TButton
      Left = 0
      Top = 0
      Width = 162
      Height = 45
      Action = actIncluir
      Align = alTop
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object btnAlterar: TButton
      Left = 0
      Top = 45
      Width = 162
      Height = 45
      Action = actAlterar
      Align = alTop
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object btnPesquisar: TButton
      Left = 0
      Top = 90
      Width = 162
      Height = 45
      Action = actPesquisar
      Align = alTop
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object btnExcluir: TButton
      Left = 0
      Top = 135
      Width = 162
      Height = 45
      Action = actExcluir
      Align = alTop
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
  end
  object cdsCadastro: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCadastro'
    Left = 408
    Top = 8
  end
  object alCadastro: TActionList
    Left = 408
    Top = 68
    object actIncluir: TAction
      Caption = '&Incluir'
      OnExecute = actIncluirExecute
    end
    object actAlterar: TAction
      Caption = '&Alterar'
      OnExecute = actAlterarExecute
    end
    object actPesquisar: TAction
      Caption = '&Pesquisar'
      OnExecute = actPesquisarExecute
    end
    object actExcluir: TAction
      Caption = '&Excluir'
      OnExecute = actExcluirExecute
    end
    object actSalvar: TAction
      Caption = '&Salvar'
      OnExecute = actSalvarExecute
    end
    object actCancelar: TAction
      Caption = '&Cancelar'
      OnExecute = actCancelarExecute
    end
  end
  object qryCadastro: TFDQuery
    ConstraintsEnabled = True
    Left = 408
    Top = 124
  end
  object dspCadastro: TDataSetProvider
    DataSet = qryCadastro
    Left = 408
    Top = 180
  end
end
