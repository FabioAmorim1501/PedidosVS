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
    TabOrder = 0
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
    end
    object actAlterar: TAction
      Caption = '&Alterar'
    end
    object actPesquisar: TAction
      Caption = '&Pesquisar'
    end
    object actExcluir: TAction
      Caption = '&Excluir'
    end
    object actSalvar: TAction
      Caption = '&Salvar'
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
