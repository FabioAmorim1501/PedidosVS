inherited frmCadastroPedido: TfrmCadastroPedido
  Caption = 'Cadastro de Pedido'
  ClientHeight = 551
  ClientWidth = 717
  ExplicitWidth = 733
  ExplicitHeight = 590
  PixelsPerInch = 120
  TextHeight = 16
  inherited pnlDados: TPanel
    Width = 553
    Height = 551
    ExplicitWidth = 553
    ExplicitHeight = 551
    inherited lblRegistros: TLabel
      AlignWithMargins = True
      Top = 274
      Width = 537
      Margins.Left = 8
      Margins.Top = 0
      Margins.Right = 8
      Margins.Bottom = 0
      Align = alBottom
      Caption = 'Itens Inseridos'
      ExplicitTop = 274
      ExplicitWidth = 111
    end
    object lblNUMERO: TLabel [1]
      Left = 8
      Top = 8
      Width = 49
      Height = 21
      Caption = 'Pedido'
    end
    object lblDTEMISSAO: TLabel [2]
      Left = 76
      Top = 8
      Width = 62
      Height = 21
      Caption = 'Emiss'#227'o'
    end
    object lblCLIENTE: TLabel [3]
      Left = 8
      Top = 68
      Width = 51
      Height = 21
      Caption = 'Cliente'
    end
    inherited grdRegistros: TStringGrid
      Top = 299
      Width = 537
      Margins.Top = 4
      ExplicitTop = 299
      ExplicitWidth = 537
    end
    inherited pnlNav: TPanel
      Top = 522
      Width = 553
      ExplicitTop = 522
      ExplicitWidth = 553
      inherited btnAvancar: TButton
        Left = 518
        Top = -1
        Anchors = [akTop, akRight]
        ExplicitLeft = 518
        ExplicitTop = -1
      end
      inherited btnRetroceder: TButton
        Left = 410
        Top = -1
        Anchors = [akTop, akRight]
        ExplicitLeft = 410
        ExplicitTop = -1
      end
      inherited txtPagNav: TStaticText
        Left = 438
        Top = 1
        Anchors = [akTop, akRight]
        ExplicitLeft = 438
        ExplicitTop = 1
      end
    end
    object nmbNUMERO: TNumberBox
      Left = 8
      Top = 32
      Width = 62
      Height = 29
      Enabled = False
      ReadOnly = True
      TabOrder = 2
      UseNaNValue = True
    end
    object edtCLIENTE: TEdit
      Left = 10
      Top = 89
      Width = 537
      Height = 29
      Anchors = [akLeft, akTop, akRight]
      Enabled = False
      MaxLength = 100
      TabOrder = 3
      OnEnter = edtCLIENTEEnter
      OnExit = edtCLIENTEExit
    end
    object pnlItem: TPanel
      AlignWithMargins = True
      Left = 8
      Top = 136
      Width = 537
      Height = 130
      Margins.Left = 8
      Margins.Top = 0
      Margins.Right = 8
      Margins.Bottom = 8
      Align = alBottom
      BevelEdges = [beTop, beBottom]
      BevelKind = bkFlat
      BevelOuter = bvNone
      TabOrder = 4
      DesignSize = (
        537
        126)
      object lblIDITEM: TLabel
        Left = 8
        Top = 8
        Width = 50
        Height = 21
        Caption = 'Codigo'
      end
      object lblDESCITEM: TLabel
        Left = 101
        Top = 8
        Width = 73
        Height = 21
        Caption = 'Descri'#231#227'o'
      end
      object lblQUANTIDADE: TLabel
        Left = 10
        Top = 64
        Width = 85
        Height = 21
        Anchors = [akTop, akRight]
        Caption = 'Quantidade'
      end
      object lblVALORUNIT: TLabel
        Left = 101
        Top = 64
        Width = 140
        Height = 21
        Anchors = [akTop, akRight]
        Caption = 'Valor Unit'#225'rio (R$)'
      end
      object lblVALORTOTAL: TLabel
        Left = 252
        Top = 61
        Width = 120
        Height = 21
        Anchors = [akTop, akRight]
        Caption = 'Valor Total (R$)'
      end
      object nmbIDITEM: TNumberBox
        Left = 8
        Top = 31
        Width = 87
        Height = 29
        Enabled = False
        TabOrder = 0
        UseNaNValue = True
        OnChange = nmbIDITEMChange
      end
      object edtDESCITEM: TEdit
        Left = 101
        Top = 29
        Width = 428
        Height = 29
        Anchors = [akLeft, akTop, akRight]
        Enabled = False
        MaxLength = 100
        ReadOnly = True
        TabOrder = 1
      end
      object nmbQUANTIDADE: TNumberBox
        Left = 10
        Top = 88
        Width = 85
        Height = 29
        Anchors = [akTop, akRight]
        Enabled = False
        TabOrder = 2
        UseNaNValue = True
        OnChange = CalcValorTotalOnChange
      end
      object nmbVALORUNIT: TNumberBox
        Left = 101
        Top = 88
        Width = 145
        Height = 29
        Anchors = [akTop, akRight]
        Enabled = False
        Mode = nbmCurrency
        TabOrder = 3
        UseNaNValue = True
        OnChange = CalcValorTotalOnChange
      end
      object nmbVALORTOTAL: TNumberBox
        Left = 252
        Top = 88
        Width = 145
        Height = 29
        Anchors = [akTop, akRight]
        Enabled = False
        Mode = nbmCurrency
        ReadOnly = True
        TabOrder = 4
        UseNaNValue = True
      end
      object btnAdicionarItem: TButton
        Left = 403
        Top = 73
        Width = 127
        Height = 45
        Action = actAdicionarItem
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
      end
    end
    object lblLegendaBoxItem: TStaticText
      Left = 8
      Top = 124
      Width = 113
      Height = 25
      AutoSize = False
      Caption = 'Item a Inserir'
      TabOrder = 5
    end
  end
  inherited pnlBotoes: TPanel
    Left = 553
    Height = 551
    Font.Height = -20
    ParentFont = False
    ExplicitLeft = 553
    ExplicitHeight = 551
    object lblValorTotalPedido: TLabel [0]
      Left = 0
      Top = 488
      Width = 162
      Height = 31
      Margins.Left = 8
      Margins.Top = 4
      Margins.Right = 8
      Margins.Bottom = 4
      Align = alBottom
      Alignment = taCenter
      AutoSize = False
      Caption = 'Valor Total (R$)'
      Color = clBtnShadow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -20
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = False
      Layout = tlCenter
    end
    object nmbValorTotalPedido: TNumberBox
      Left = 0
      Top = 519
      Width = 162
      Height = 32
      Margins.Left = 8
      Margins.Top = 0
      Margins.Right = 8
      Margins.Bottom = 8
      Align = alBottom
      Alignment = taCenter
      AutoSize = False
      BorderStyle = bsNone
      Enabled = False
      Mode = nbmCurrency
      ReadOnly = True
      TabOrder = 4
      UseNaNValue = True
    end
  end
  object edtDTEMISSAO: TMaskEdit [2]
    Left = 76
    Top = 32
    Width = 100
    Height = 29
    Enabled = False
    EditMask = '!99/99/0000;1;_'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Tahoma'
    Font.Style = []
    MaxLength = 10
    ParentFont = False
    TabOrder = 2
    Text = '  /  /    '
    OnEnter = edtDTEMISSAOEnter
    OnExit = edtDTEMISSAOExit
  end
  inherited cdsCadastro: TClientDataSet
    OnCalcFields = cdsCadastroCalcFields
    Left = 476
    Top = 448
    object cdsCadastroIDPEDIDOITEM: TIntegerField
      DisplayLabel = 'Codigo do Item do Pedido'
      FieldName = 'IDPEDIDOITEM'
      Visible = False
    end
    object cdsCadastroIDPEDIDOCAB: TIntegerField
      DisplayLabel = 'Codigo do Pedido'
      FieldName = 'IDPEDIDOCAB'
      Visible = False
    end
    object cdsCadastroIDITEM: TIntegerField
      DisplayLabel = 'Codigo do Item'
      FieldName = 'IDITEM'
    end
    object cdsCadastroDESCITEM: TStringField
      DisplayLabel = 'Descri'#231#227'o do Item'
      FieldKind = fkInternalCalc
      FieldName = 'DESCITEM'
      Size = 100
    end
    object cdsCadastroQUANTIDADE: TFloatField
      DisplayLabel = 'Quantidade'
      FieldName = 'QUANTIDADE'
    end
    object cdsCadastroVALORUNIT: TFloatField
      DisplayLabel = 'Valor Unit.'
      FieldName = 'VALORUNIT'
    end
    object cdsCadastroVALORTOTAL: TFloatField
      DisplayLabel = 'Valor Total'
      FieldName = 'VALORTOTAL'
    end
    object cdsCadastroSOMA_VALORTOTAL: TAggregateField
      DefaultExpression = 'SUM(VALORTOTAL)'
      DisplayLabel = 'Valor Total do Pedido'
      FieldName = 'SOMA_VALORTOTAL'
      Active = True
      DisplayName = ''
    end
  end
  inherited alCadastro: TActionList
    Left = 572
    Top = 188
    object actAdicionarItem: TAction
      Caption = 'A&dicionar'
      OnExecute = actAdicionarItemExecute
    end
  end
  inherited qryCadastro: TFDQuery
    SQL.Strings = (
      'SELECT * FROM PEDIDOITEM WHERE IDPEDIDOCAB = :IDPEDIDOCAB')
    Left = 428
    Top = 460
    ParamData = <
      item
        Name = 'IDPEDIDOCAB'
        ParamType = ptInput
      end>
    object qryCadastroIDPEDIDOITEM: TIntegerField
      FieldName = 'IDPEDIDOITEM'
      Visible = False
    end
    object qryCadastroIDPEDIDOCAB: TIntegerField
      FieldName = 'IDPEDIDOCAB'
      Visible = False
    end
    object qryCadastroIDITEM: TIntegerField
      FieldName = 'IDITEM'
    end
    object qryCadastroQUANTIDADE: TFloatField
      FieldName = 'QUANTIDADE'
    end
    object qryCadastroVALORUNIT: TFloatField
      FieldName = 'VALORUNIT'
    end
    object qryCadastroVALORTOTAL: TFloatField
      FieldName = 'VALORTOTAL'
    end
  end
  inherited dspCadastro: TDataSetProvider
    Left = 380
    Top = 448
  end
  object cdsPedido: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPedido'
    AfterPost = cdsPedidoAfterPost
    Left = 512
    Top = 24
    object cdsPedidoIDPEDIDOCAB: TIntegerField
      FieldName = 'IDPEDIDOCAB'
    end
    object cdsPedidoDTEMISSAO: TDateField
      FieldName = 'DTEMISSAO'
    end
    object cdsPedidoNUMERO: TIntegerField
      FieldName = 'NUMERO'
    end
    object cdsPedidoCLIENTE: TStringField
      FieldName = 'CLIENTE'
    end
  end
  object qryPedido: TFDQuery
    ConstraintsEnabled = True
    SQL.Strings = (
      'SELECT * FROM PEDIDOCAB')
    Left = 420
    Top = 28
    object qryPedidoIDPEDIDOCAB: TIntegerField
      FieldName = 'IDPEDIDOCAB'
    end
    object qryPedidoDTEMISSAO: TDateField
      FieldName = 'DTEMISSAO'
    end
    object qryPedidoNUMERO: TIntegerField
      FieldName = 'NUMERO'
    end
    object qryPedidoCLIENTE: TStringField
      FieldName = 'CLIENTE'
    end
  end
  object dspPedido: TDataSetProvider
    DataSet = qryPedido
    Left = 468
    Top = 12
  end
end
