program PedidosVS;

uses
  Vcl.Forms,
  untFormPrincipal in 'untFormPrincipal.pas' {frmPrincipal},
  untFormCadastroBase in 'untFormCadastroBase.pas' {frmCadastroBase};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
