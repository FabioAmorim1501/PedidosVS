unit untFormCadastroBase;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Math, Controls, Forms, Dialogs, Actions, ActnList, DB, DBClient,
  StdCtrls, ExtCtrls, NumberBox, Grids, FMTBcd, Provider, UITypes, FireDAC.Stan.Def, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Phys.FBDef, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.IBBase, FireDAC.UI.Intf, FireDAC.VCLUI.Wait, FireDAC.Comp.UI;

const
  LinhasPPagina = 9;

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
    lblRegistros: TLabel;
    grdRegistros: TStringGrid;
    pnlNav: TPanel;
    btnAvancar: TButton;
    btnRetroceder: TButton;
    txtPagNav: TStaticText;
    actCancelar: TAction;
    procedure FormCreate(Sender: TObject);
    function CarregarLinhas(const AQuantidade: Integer = LinhasPPagina; const AOffset: Integer = 0)
      : TfrmCadastroBase; virtual;
    procedure btnRetrocederClick(Sender: TObject);
    procedure btnAvancarClick(Sender: TObject);
    procedure actSalvarExecute(Sender: TObject);
    procedure actIncluirExecute(Sender: TObject);
    procedure actAlterarExecute(Sender: TObject);
    function PodeAgir(const APodeClicar: Boolean): TfrmCadastroBase;
    procedure actExcluirExecute(Sender: TObject);
    procedure actCancelarExecute(Sender: TObject);
    procedure actPesquisarExecute(Sender: TObject);
    procedure Validacoes; virtual;
    procedure AntesDeSalvar; virtual;
  private
    { Private declarations }
  protected
    FOffsetAtual: Integer;
  public
    { Public declarations }
  end;

var
  frmCadastroBase: TfrmCadastroBase;

implementation

uses
  untBancoDados, untAuxiliar;

{$R *.dfm}

procedure TfrmCadastroBase.FormCreate(Sender: TObject);
begin
  qryCadastro.Connection := TBancoDados.ConexaoBD;
  FOffsetAtual := 0;
  CarregarCabecalho(cdsCadastro, grdRegistros);
  CarregarLinhas;
end;

function TfrmCadastroBase.PodeAgir(const APodeClicar: Boolean): TfrmCadastroBase;
begin
  actIncluir.Enabled := APodeClicar;
  actAlterar.Enabled := APodeClicar;
  actPesquisar.Enabled := APodeClicar;
  actExcluir.Enabled := APodeClicar;
  Result := Self;
end;

procedure TfrmCadastroBase.Validacoes;
begin
  // A ser implementado nos filhos
end;

procedure TfrmCadastroBase.AntesDeSalvar;
begin
  // A ser implementado nos filhos
end;

procedure TfrmCadastroBase.actAlterarExecute(Sender: TObject);
begin
  PodeAgir(False);
  cdsCadastro.Edit;
  btnIncluir.Action := actSalvar;
  btnAlterar.Action := actCancelar;
end;

procedure TfrmCadastroBase.actCancelarExecute(Sender: TObject);
begin
  if (cdsCadastro.Filtered) then
  begin
    cdsCadastro.Filtered := False;
    CarregarLinhas;
  end;
  if (cdsCadastro.UpdatesPending) then
    cdsCadastro.Cancel;
  btnIncluir.Action := actIncluir;
  btnAlterar.Action := actAlterar;
  PodeAgir(True);
end;

procedure TfrmCadastroBase.actExcluirExecute(Sender: TObject);
var
  MessageResult: Integer;
begin
  MessageResult := MessageDlg(Format('Deseja cancelar o registro %s?', [grdRegistros.Rows[grdRegistros.Row].DelimitedText]),
    mtConfirmation, mbYesNo, HelpContext);
  if (MessageResult = mrYes) then
  begin
    TBancoDados.ConexaoBD.StartTransaction;
    try
      cdsCadastro.Delete;
      cdsCadastro.ApplyUpdates(-1);
      TBancoDados.ConexaoBD.Commit;
      cdsCadastro.Refresh;
    except
      on E: Exception do
      begin
        TBancoDados.ConexaoBD.Rollback;
        Raise;
      end;
    end;
    CarregarLinhas;
  end;
end;

procedure TfrmCadastroBase.actIncluirExecute(Sender: TObject);
begin
  PodeAgir(False);
  cdsCadastro.Append;
  btnIncluir.Action := actSalvar;
  btnAlterar.Action := actCancelar;
end;

procedure TfrmCadastroBase.actPesquisarExecute(Sender: TObject);
begin
  PodeAgir(False);
  btnAlterar.Action := actCancelar;
end;

procedure TfrmCadastroBase.actSalvarExecute(Sender: TObject);
begin
  Validacoes;
  try
    TBancoDados.ConexaoBD.StartTransaction;
    try
      AntesDeSalvar;
      cdsCadastro.Post;
      cdsCadastro.ApplyUpdates(-1);
      TBancoDados.ConexaoBD.Commit;
      cdsCadastro.Refresh;
    except
      on E: Exception do
      begin
        TBancoDados.ConexaoBD.Rollback;
        Raise;
      end;
    end;
    btnIncluir.Action := actIncluir;
    btnAlterar.Action := actAlterar;
    CarregarLinhas;
  finally
    PodeAgir(True);
  end;
end;

procedure TfrmCadastroBase.btnAvancarClick(Sender: TObject);
begin
  CarregarLinhas(LinhasPPagina, LinhasPPagina);
end;

procedure TfrmCadastroBase.btnRetrocederClick(Sender: TObject);
begin
  CarregarLinhas(LinhasPPagina, -LinhasPPagina);
end;

function TfrmCadastroBase.CarregarLinhas(const AQuantidade: Integer; const AOffset: Integer): TfrmCadastroBase;
var
  Offset: Integer;
  PgAtual, TotalPG, RowIndex: Integer;
  Linha: TStrings;
  Field: TField;
begin
  grdRegistros.BeginUpdate;
  try
    RowIndex := grdRegistros.RowCount;
    while RowIndex > 1 do
    begin
      grdRegistros.Rows[RowIndex].Clear;
      Inc(RowIndex, -1);
    end;
    grdRegistros.RowCount := Min(cdsCadastro.RecordCount + 1, LinhasPPagina);
    Offset := (FOffsetAtual + AOffset);
    Offset := IfThen(cdsCadastro.RecordCount <= Offset, Max(Offset - LinhasPPagina, 0), Offset);
    if not(cdsCadastro.IsEmpty) then
    begin
      cdsCadastro.RecNo := 1 + Ord(Offset);
      repeat
        Linha := TStringList.Create;
        Linha.Add('');
        for Field in cdsCadastro.Fields do
        begin
          Linha.Add(Field.AsString);
        end;
        grdRegistros.Rows[Max(cdsCadastro.RecNo - Offset, 1)] := Linha;
        cdsCadastro.Next;
      until (cdsCadastro.EoF) or ((cdsCadastro.RecNo - Offset) = AQuantidade);
    end;
  finally
    grdRegistros.EndUpdate;
  end;

  PgAtual := Ceil(cdsCadastro.RecNo / LinhasPPagina);
  TotalPG := Ceil(cdsCadastro.RecordCount / LinhasPPagina);
  txtPagNav.Caption := Format('%d/%d', [PgAtual, TotalPG]);
  btnRetroceder.Enabled := PgAtual > 1;
  btnAvancar.Enabled := PgAtual < TotalPG;
  FOffsetAtual := Offset;
  Result := Self;
end;

end.
