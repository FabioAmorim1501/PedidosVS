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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

end.
