unit untFormPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, Actions, ActnList, Menus;

type
  TfrmPrincipal = class(TForm)
    mmnMenuPrincipal: TMainMenu;
    miManutencao: TMenuItem;
    miPedidos: TMenuItem;
    alPrincipal: TActionList;
    actItens: TAction;
    actPedidos: TAction;
    procedure actItensExecute(Sender: TObject);
    procedure actPedidosExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  untFormCadastroBase, untFormCadastroItens, untFormCadastroPedido;

{$R *.dfm}

procedure TfrmPrincipal.actItensExecute(Sender: TObject);
var
  CadastroItens: TfrmCadastroItens;
begin
  CadastroItens := TfrmCadastroItens.Create(Self);
  try
    CadastroItens.ShowModal;
  finally
    CadastroItens.Free;
  end;
end;

procedure TfrmPrincipal.actPedidosExecute(Sender: TObject);
var
  CadastroPedido: TfrmCadastroPedido;
begin
  CadastroPedido := TfrmCadastroPedido.Create(Self);
  try
    CadastroPedido.ShowModal;
  finally
    CadastroPedido.Free;
  end;
end;

end.
