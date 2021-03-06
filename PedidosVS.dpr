program PedidosVS;

uses
  Forms,
  untAuxiliar in 'untAuxiliar.pas',
  untBancoDados in 'untBancoDados.pas',
  untFormCadastroBase in 'untFormCadastroBase.pas' {frmCadastroBase},
  untFormCadastroItens in 'untFormCadastroItens.pas' {frmCadastroItens},
  untFormCadastroPedido in 'untFormCadastroPedido.pas' {frmCadastroPedido},
  untFormPrincipal in 'untFormPrincipal.pas' {frmPrincipal},
  untModel in 'untModel.pas',
  untFormRelatorioPedidos in 'untFormRelatorioPedidos.pas' {frmLstPedidos};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmLstPedidos, frmLstPedidos);
  Application.Run;
end.
