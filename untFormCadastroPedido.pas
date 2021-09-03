unit untFormCadastroPedido;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untFormCadastroBase, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Datasnap.Provider, FireDAC.Comp.DataSet, FireDAC.Comp.Client, System.Actions, Vcl.ActnList, Data.DB, Datasnap.DBClient,
  Vcl.StdCtrls, Vcl.Grids, Vcl.ExtCtrls;

type
  TfrmCadastroPedido = class(TfrmCadastroBase)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroPedido: TfrmCadastroPedido;

implementation

{$R *.dfm}

end.
