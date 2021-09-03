program PedidosVS;

uses
  Vcl.Forms,
  untFormPrincipal in 'untFormPrincipal.pas' {frmPrincipal},
  untFormCadastroBase in 'untFormCadastroBase.pas' {frmCadastroBase},
  untFormCadastroItens in 'untFormCadastroItens.pas' {frmCadastroItens},
  untBancoDados in 'untBancoDados.pas',
  untFormCadastroPedido in 'untFormCadastroPedido.pas' {frmCadastroPedido};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmCadastroPedido, frmCadastroPedido);
  Application.Run;
end.
