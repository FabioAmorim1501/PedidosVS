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
      Caption = '&Pedidos'
      object miCadastroPedidos: TMenuItem
        Action = actCadastroPedidos
      end
      object miRelatriodePedidos: TMenuItem
        Action = actLstPedidos
      end
    end
  end
  object alPrincipal: TActionList
    Left = 296
    Top = 4
    object actItens: TAction
      Caption = 'Cadastro de &Itens'
      OnExecute = actItensExecute
    end
    object actCadastroPedidos: TAction
      Caption = 'Cadastro &Pedidos'
      OnExecute = actCadastroPedidosExecute
    end
    object actLstPedidos: TAction
      Caption = '&Relat'#243'rio de Pedidos'
      OnExecute = actLstPedidosExecute
    end
  end
end
