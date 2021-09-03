inherited frmCadastroItens: TfrmCadastroItens
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Itens'
  ClientHeight = 404
  ClientWidth = 628
  ExplicitWidth = 634
  ExplicitHeight = 433
  PixelsPerInch = 120
  TextHeight = 16
  inherited pnlDados: TPanel
    Width = 464
    Height = 404
    Font.Height = -17
    ParentFont = False
    ExplicitWidth = 464
    ExplicitHeight = 404
    object lblIDITEM: TLabel
      Left = 8
      Top = 8
      Width = 50
      Height = 21
      Caption = 'Codigo'
    end
    object lblDESCITEM: TLabel
      Left = 8
      Top = 66
      Width = 73
      Height = 21
      Caption = 'Descri'#231#227'o'
    end
    object lblRegistros: TLabel
      Left = 8
      Top = 126
      Width = 70
      Height = 21
      Caption = 'Registros'
    end
    object nmbIDITEM: TNumberBox
      Left = 8
      Top = 32
      Width = 53
      Height = 29
      Enabled = False
      ReadOnly = True
      TabOrder = 0
      UseNaNValue = True
    end
    object edtDESCITEM: TEdit
      Left = 8
      Top = 90
      Width = 448
      Height = 29
      Enabled = False
      TabOrder = 1
    end
    object grdRegistros: TStringGrid
      AlignWithMargins = True
      Left = 8
      Top = 123
      Width = 448
      Height = 244
      Margins.Left = 8
      Margins.Top = 8
      Margins.Right = 8
      Margins.Bottom = 8
      Align = alBottom
      ColCount = 3
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goFixedRowDefAlign]
      TabOrder = 2
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
      Top = 375
      Width = 464
      Height = 29
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 3
      object btnAvancar: TButton
        Left = 428
        Top = 0
        Width = 28
        Height = 25
        Caption = '>'
        TabOrder = 0
      end
      object btnRetroceder: TButton
        Left = 320
        Top = 0
        Width = 28
        Height = 25
        Caption = '<'
        TabOrder = 1
      end
      object txtPagNav: TStaticText
        Left = 348
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
  inherited pnlBotoes: TPanel
    Left = 464
    Height = 404
    ExplicitLeft = 464
    ExplicitHeight = 404
  end
  inherited cdsCadastro: TClientDataSet
    FieldOptions.UpdatePersistent = True
    Top = 4
    object cdsCadastroIDITEM: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'IDITEM'
      ProviderFlags = [pfInKey]
      ReadOnly = True
    end
    object cdsCadastroDESCITEM: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCITEM'
      Size = 100
    end
  end
  inherited alCadastro: TActionList
    Left = 340
    Top = 4
    inherited actIncluir: TAction
      OnExecute = actIncluirExecute
    end
    inherited actSalvar: TAction
      OnExecute = actSalvarExecute
    end
  end
  inherited qryCadastro: TFDQuery
    ConstraintsEnabled = False
    SQL.Strings = (
      'SELECT * FROM ITEM')
    Left = 252
    Top = 4
    object qryCadastroIDITEM: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'IDITEM'
      ProviderFlags = [pfInKey]
      ReadOnly = True
    end
    object qryCadastroDESCITEM: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCITEM'
      Size = 100
    end
  end
  inherited dspCadastro: TDataSetProvider
    ResolveToDataSet = True
    Left = 180
    Top = 4
  end
end
