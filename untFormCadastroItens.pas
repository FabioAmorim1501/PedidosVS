unit untFormCadastroItens;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Math, Controls, Forms, Dialogs, untFormCadastroBase, Actions,
  ActnList, DB, DBClient, StdCtrls, ExtCtrls, NumberBox, Grids, FMTBcd, Provider, UITypes, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmCadastroItens = class(TfrmCadastroBase)
    nmbIDITEM: TNumberBox;
    lblIDITEM: TLabel;
    lblDESCITEM: TLabel;
    edtDESCITEM: TEdit;
    cdsCadastroIDITEM: TIntegerField;
    cdsCadastroDESCITEM: TStringField;
    qryCadastroIDITEM: TIntegerField;
    qryCadastroDESCITEM: TStringField;
    procedure actIncluirExecute(Sender: TObject);
    procedure actSalvarExecute(Sender: TObject);
    procedure grdRegistrosSelectCell(Sender: TObject; ACol, ARow: Integer; var CanSelect: Boolean);
    procedure actAlterarExecute(Sender: TObject);
    procedure actCancelarExecute(Sender: TObject);
    procedure actPesquisarExecute(Sender: TObject);
    procedure nmbIDITEMChange(Sender: TObject);
    procedure edtDESCITEMChange(Sender: TObject);
    procedure Validacoes; override;
    procedure AntesDeSalvar; override;
  private
    procedure PodeEditar(const AEditar: Boolean);
    procedure LimparCampos;
    procedure Pesquisar;
  public
    { Public declarations }
  end;

var
  frmCadastroItens: TfrmCadastroItens;

implementation

uses
  StrUtils, untBancoDados;

{$R *.dfm}

procedure TfrmCadastroItens.actAlterarExecute(Sender: TObject);
begin
  PodeEditar(True);
  inherited;
  nmbIDITEM.Value := cdsCadastroIDITEM.Value;
  edtDESCITEM.Text := cdsCadastroDESCITEM.AsString;
  edtDESCITEM.SetFocus;
end;

procedure TfrmCadastroItens.actCancelarExecute(Sender: TObject);
begin
  nmbIDITEM.ReadOnly := True;
  nmbIDITEM.OnChange := nil;
  edtDESCITEM.OnChange := nil;
  PodeEditar(False);
  inherited;
  LimparCampos;
end;

procedure TfrmCadastroItens.actIncluirExecute(Sender: TObject);
begin
  PodeEditar(True);
  inherited;
  nmbIDITEM.Value := -1;
  edtDESCITEM.SetFocus;
end;

procedure TfrmCadastroItens.actPesquisarExecute(Sender: TObject);
begin
  PodeEditar(True);
  inherited;
  nmbIDITEM.ReadOnly := False;
  nmbIDITEM.Text := '';
  nmbIDITEM.SetFocus;
  nmbIDITEM.OnChange := nmbIDITEMChange;
  edtDESCITEM.OnChange := edtDESCITEMChange;
end;

procedure TfrmCadastroItens.actSalvarExecute(Sender: TObject);
begin
  PodeEditar(False);
  try
    inherited;
  except
    on E: Exception do
    begin
      PodeEditar(True);
      Raise;
    end;
  end;
  LimparCampos;
end;

procedure TfrmCadastroItens.AntesDeSalvar;
begin
  cdsCadastroDESCITEM.AsString := edtDESCITEM.Text;
end;

procedure TfrmCadastroItens.edtDESCITEMChange(Sender: TObject);
begin
  inherited;
  Pesquisar;
end;

procedure TfrmCadastroItens.grdRegistrosSelectCell(Sender: TObject; ACol, ARow: Integer; var CanSelect: Boolean);
begin
  inherited;
  cdsCadastro.RecNo := FOffsetAtual + ARow;
end;

procedure TfrmCadastroItens.LimparCampos;
begin
  nmbIDITEM.Clear;
  edtDESCITEM.Clear;
end;

procedure TfrmCadastroItens.nmbIDITEMChange(Sender: TObject);
begin
  inherited;
  Pesquisar;
end;

procedure TfrmCadastroItens.Pesquisar;
var
  Filtrar: Boolean;
begin
  Filtrar := (Trim(nmbIDITEM.Text) <> '') or (Trim(edtDESCITEM.Text) <> '');
  if(Filtrar)then
  begin
    cdsCadastro.Filtered := False;
    cdsCadastro.Filter := Format('%s = %d ', [cdsCadastroIDITEM.FieldName, nmbIDITEM.ValueInt]) +
      IfThen(Trim(edtDESCITEM.Text) <> '', Format('OR UPPER(%s) LIKE UPPER(''%%%s%%'')', [cdsCadastroDESCITEM.FieldName,
      edtDESCITEM.Text]));
  end;
  cdsCadastro.Filter := IfThen(Filtrar, cdsCadastro.Filter);
  cdsCadastro.Filtered := Filtrar;
  CarregarLinhas;
end;

procedure TfrmCadastroItens.PodeEditar(const AEditar: Boolean);
begin
  nmbIDITEM.Enabled := AEditar;
  edtDESCITEM.Enabled := AEditar;
end;

procedure TfrmCadastroItens.Validacoes;
begin
  inherited;
  if(Trim(edtDESCITEM.Text) = '')then
  begin
    MessageDlg('O campo Descrição precisa ser preenchido!', mtWarning, [mbOK], HelpContext);
    Abort;
  end;
end;

end.
