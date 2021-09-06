inherited frmCadastroItens: TfrmCadastroItens
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Itens'
  ClientHeight = 422
  ClientWidth = 628
  ExplicitWidth = 634
  ExplicitHeight = 451
  PixelsPerInch = 120
  TextHeight = 16
  inherited pnlDados: TPanel
    Width = 464
    Height = 422
    ExplicitWidth = 464
    ExplicitHeight = 422
    inherited lblRegistros: TLabel
      Top = 128
      ExplicitTop = 128
    end
    object lblIDITEM: TLabel [1]
      Left = 8
      Top = 8
      Width = 50
      Height = 21
      Caption = 'Codigo'
    end
    object lblDESCITEM: TLabel [2]
      Left = 8
      Top = 68
      Width = 73
      Height = 21
      Caption = 'Descri'#231#227'o'
    end
    inherited grdRegistros: TStringGrid
      Top = 152
      Width = 448
      Height = 233
      TabOrder = 2
      OnSelectCell = grdRegistrosSelectCell
      ExplicitTop = 152
      ExplicitWidth = 448
      ExplicitHeight = 233
    end
    inherited pnlNav: TPanel
      Top = 393
      Width = 464
      TabOrder = 3
      ExplicitTop = 393
      ExplicitWidth = 464
      inherited btnAvancar: TButton
        Left = 428
        ExplicitLeft = 428
      end
      inherited btnRetroceder: TButton
        Left = 320
        ExplicitLeft = 320
      end
      inherited txtPagNav: TStaticText
        Left = 348
        ExplicitLeft = 348
      end
    end
    object nmbIDITEM: TNumberBox
      Left = 8
      Top = 32
      Width = 80
      Height = 29
      Enabled = False
      ReadOnly = True
      TabOrder = 0
      UseNaNValue = True
    end
    object edtDESCITEM: TEdit
      Left = 8
      Top = 92
      Width = 448
      Height = 29
      Enabled = False
      MaxLength = 100
      TabOrder = 1
    end
  end
  inherited pnlBotoes: TPanel
    Left = 464
    Height = 422
    ExplicitLeft = 464
    ExplicitHeight = 422
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
  end
  inherited qryCadastro: TFDQuery
    ConstraintsEnabled = False
    SQL.Strings = (
      'SELECT * FROM ITEM ORDER BY 1')
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
