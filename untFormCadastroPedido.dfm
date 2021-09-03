inherited frmCadastroPedido: TfrmCadastroPedido
  Caption = 'frmCadastroPedido'
  ClientHeight = 498
  ClientWidth = 683
  ExplicitWidth = 699
  ExplicitHeight = 537
  PixelsPerInch = 120
  TextHeight = 16
  inherited pnlDados: TPanel
    Width = 519
    Height = 498
    inherited lblRegistros: TLabel
      Top = 222
      Width = 57
      Caption = 'Pedidos'
      ExplicitTop = 222
      ExplicitWidth = 57
    end
    inherited grdRegistros: TStringGrid
      Top = 246
      Width = 503
      ExplicitLeft = 7
      ExplicitTop = 98
      ExplicitWidth = 503
    end
    inherited pnlNav: TPanel
      Top = 469
      Width = 519
      ExplicitTop = 363
      ExplicitWidth = 452
      inherited btnAvancar: TButton
        Left = 483
        Top = -1
        ExplicitLeft = 483
        ExplicitTop = -1
      end
      inherited btnRetroceder: TButton
        Left = 375
        Top = -1
        ExplicitLeft = 375
        ExplicitTop = -1
      end
      inherited txtPagNav: TStaticText
        Left = 403
        Top = 1
        ExplicitLeft = 403
        ExplicitTop = 1
      end
    end
  end
  inherited pnlBotoes: TPanel
    Left = 519
    Height = 498
  end
  inherited qryCadastro: TFDQuery
    SQL.Strings = (
      'SELECT * FROM PEDIDOCAB')
  end
end
