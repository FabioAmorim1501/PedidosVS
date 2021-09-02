unit untFormCadastroBase;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, Data.DB, Datasnap.DBClient,
  Vcl.ExtCtrls, Vcl.StdCtrls, System.Actions, Vcl.ActnList;

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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroBase: TfrmCadastroBase;

implementation

{$R *.dfm}

end.
