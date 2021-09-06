object frmLstPedidos: TfrmLstPedidos
  Left = 0
  Top = 0
  Caption = 'Relat'#243'rio de Pedidos'
  ClientHeight = 658
  ClientWidth = 1224
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlFundo: TPanel
    Left = 0
    Top = 0
    Width = 1224
    Height = 658
    Align = alClient
    BevelOuter = bvNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object grdItensPedido: TDBGrid
      Left = 449
      Top = 0
      Width = 775
      Height = 658
      Align = alClient
      DataSource = dsItensPedido
      ReadOnly = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'IDITEM'
          Title.Alignment = taCenter
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCITEM'
          Title.Alignment = taCenter
          Width = 453
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'QUANTIDADE'
          Title.Alignment = taCenter
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALORUNIT'
          Title.Alignment = taCenter
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALORTOTAL'
          Title.Alignment = taCenter
          Visible = True
        end>
    end
    object pnlPedido: TPanel
      Left = 0
      Top = 0
      Width = 449
      Height = 658
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 0
      object lblFiltroData: TLabel
        Left = 8
        Top = 67
        Width = 96
        Height = 16
        Caption = 'Data Emiss'#227'o &De'
        FocusControl = edtDTEmissaoDe
      end
      object lblDTEmissaoAte: TLabel
        Left = 195
        Top = 67
        Width = 19
        Height = 16
        Caption = '&At'#233
        FocusControl = edtDTEmissaoAte
      end
      object lblFiltroCliente: TLabel
        Left = 65
        Top = 8
        Width = 39
        Height = 16
        Alignment = taRightJustify
        Caption = '&Cliente'
        FocusControl = edtFiltroCliente
      end
      object lblFiltroItem: TLabel
        Left = 78
        Top = 38
        Width = 26
        Height = 16
        Alignment = taRightJustify
        Caption = '&Item'
        FocusControl = edtFiltroItem
      end
      object grdPedidos: TDBGrid
        Left = 0
        Top = 95
        Width = 449
        Height = 563
        Align = alBottom
        DataSource = dsPedidos
        ReadOnly = True
        TabOrder = 5
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'IDPEDIDOCAB'
            Title.Alignment = taCenter
            Width = 48
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DTEMISSAO'
            Title.Alignment = taCenter
            Width = 102
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NUMERO'
            Title.Alignment = taCenter
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CLIENTE'
            Title.Alignment = taCenter
            Width = 184
            Visible = True
          end>
      end
      object btnFiltrar: TButton
        Left = 368
        Top = 64
        Width = 75
        Height = 25
        Caption = '&F'#237'ltrar'
        TabOrder = 4
        OnClick = btnFiltrarClick
      end
      object edtDTEmissaoAte: TMaskEdit
        Left = 220
        Top = 64
        Width = 77
        Height = 24
        EditMask = '!99/99/0000;1;_'
        MaxLength = 10
        TabOrder = 3
        Text = '  /  /    '
      end
      object edtDTEmissaoDe: TMaskEdit
        Left = 112
        Top = 64
        Width = 77
        Height = 24
        EditMask = '!99/99/0000;1;_'
        MaxLength = 10
        TabOrder = 2
        Text = '  /  /    '
      end
      object edtFiltroItem: TEdit
        Left = 112
        Top = 35
        Width = 331
        Height = 24
        TabOrder = 1
      end
      object edtFiltroCliente: TEdit
        Left = 112
        Top = 8
        Width = 331
        Height = 24
        TabOrder = 0
      end
    end
  end
  object qryPedidos: TFDQuery
    Left = 236
    Top = 572
    object qryPedidosIDPEDIDOCAB: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'IDPEDIDOCAB'
      Origin = 'IDPEDIDOCAB'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryPedidosDTEMISSAO: TDateField
      DisplayLabel = 'Data de Emiss'#227'o'
      FieldName = 'DTEMISSAO'
      Origin = 'DTEMISSAO'
    end
    object qryPedidosNUMERO: TIntegerField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
    end
    object qryPedidosCLIENTE: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
      Origin = 'CLIENTE'
      Size = 100
    end
  end
  object qryItensPedido: TFDQuery
    MasterSource = dsPedidos
    MasterFields = 'IDPEDIDOCAB'
    SQL.Strings = (
      'SELECT PI.IDITEM'
      '      ,I.DESCITEM '
      '      ,PI.QUANTIDADE'
      '      ,PI.VALORUNIT'
      '      ,PI.VALORTOTAL'
      '  FROM      PEDIDOITEM PI'
      ' INNER JOIN ITEM        I ON I.IDITEM = PI.IDITEM'
      ' WHERE PI.IDPEDIDOCAB = :IDPEDIDOCAB')
    Left = 1080
    Top = 116
    ParamData = <
      item
        Name = 'IDPEDIDOCAB'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object qryItensPedidoIDITEM: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'IDITEM'
      Origin = 'IDITEM'
      Required = True
    end
    object qryItensPedidoDESCITEM: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCITEM'
      Origin = 'DESCITEM'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object qryItensPedidoQUANTIDADE: TFloatField
      DisplayLabel = 'Quantidade'
      FieldName = 'QUANTIDADE'
      Origin = 'QUANTIDADE'
    end
    object qryItensPedidoVALORUNIT: TFloatField
      DisplayLabel = 'Valor Unit.'
      FieldName = 'VALORUNIT'
      Origin = 'VALORUNIT'
      currency = True
    end
    object qryItensPedidoVALORTOTAL: TFloatField
      DisplayLabel = 'Valor Total'
      FieldName = 'VALORTOTAL'
      Origin = 'VALORTOTAL'
      currency = True
    end
  end
  object dsItensPedido: TDataSource
    DataSet = qryItensPedido
    Left = 1020
    Top = 172
  end
  object dsPedidos: TDataSource
    DataSet = qryPedidos
    Left = 296
    Top = 504
  end
end
