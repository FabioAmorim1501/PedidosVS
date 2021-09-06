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
    actCadastroPedidos: TAction;
    actLstPedidos: TAction;
    miRelatriodePedidos: TMenuItem;
    miCadastroPedidos: TMenuItem;
    procedure actItensExecute(Sender: TObject);
    procedure actCadastroPedidosExecute(Sender: TObject);
    procedure actLstPedidosExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  untFormCadastroBase, untFormCadastroItens, untFormCadastroPedido,
  untFormRelatorioPedidos;

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

procedure TfrmPrincipal.actLstPedidosExecute(Sender: TObject);
var
  RelatorioPedidos: TfrmLstPedidos;
begin
  RelatorioPedidos := TfrmLstPedidos.Create(Self);
  try
    RelatorioPedidos.ShowModal;
  finally
    RelatorioPedidos.Free;
  end;
end;

procedure TfrmPrincipal.actCadastroPedidosExecute(Sender: TObject);
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
