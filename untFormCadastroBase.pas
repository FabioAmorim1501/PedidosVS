unit untFormCadastroBase;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, DB, DBClient, ExtCtrls, StdCtrls,
  Actions, ActnList, FMTBcd, untBancoDados, Provider, FireDAC.Stan.Def, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Phys.FBDef, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.IBBase, FireDAC.UI.Intf, FireDAC.VCLUI.Wait, FireDAC.Comp.UI;

type
  TfrmCadastroBase = class(TForm)
    cdsCadastro: TClientDataSet;
    pnlDados: TPanel;
    pnlBotoes: TPanel;
    btnIncluir: TButton;
    btnAlterar: TButton;
    btnPesquisar: TButton;
    btnExcluir: TButton;
    alCadastro: TActionList;
    actIncluir: TAction;
    actAlterar: TAction;
    actPesquisar: TAction;
    actExcluir: TAction;
    qryCadastro: TFDQuery;
    dspCadastro: TDataSetProvider;
    actSalvar: TAction;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroBase: TfrmCadastroBase;

implementation

{$R *.dfm}

procedure TfrmCadastroBase.FormCreate(Sender: TObject);
begin
  qryCadastro.Connection := TBancoDados.ConexaoBD;
end;

end.
