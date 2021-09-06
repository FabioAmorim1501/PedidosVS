object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Pedidos'
  ClientHeight = 291
  ClientWidth = 633
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = mmnMenuPrincipal
  OldCreateOrder = False
  PixelsPerInch = 120
  TextHeight = 16
  object mmnMenuPrincipal: TMainMenu
    Left = 204
    Top = 4
    object miManutencao: TMenuItem
      Action = actItens
    end
    object miPedidos: TMenuItem
      Action = actPedidos
    end
  end
  object alPrincipal: TActionList
    Left = 296
    Top = 4
    object actItens: TAction
      Caption = 'Cadastro de &Itens'
      OnExecute = actItensExecute
    end
    object actPedidos: TAction
      Caption = '&Pedidos'
      OnExecute = actPedidosExecute
    end
  end
end
