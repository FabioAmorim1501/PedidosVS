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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  untFormCadastroBase, untFormCadastroItens;

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

end.
