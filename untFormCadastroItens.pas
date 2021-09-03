unit untFormCadastroItens;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Math,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untFormCadastroBase, System.Actions, Vcl.ActnList, Data.DB, Datasnap.DBClient,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.NumberBox, Vcl.Grids, Data.FMTBcd, Data.SqlExpr, Data.DBXInterBase, Datasnap.Provider,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmCadastroItens = class(TfrmCadastroBase)
    nmbIDITEM: TNumberBox;
    lblIDITEM: TLabel;
    lblDESCITEM: TLabel;
    edtDESCITEM: TEdit;
    lblRegistros: TLabel;
    grdRegistros: TStringGrid;
    cdsCadastroIDITEM: TIntegerField;
    cdsCadastroDESCITEM: TStringField;
    pnlNav: TPanel;
    btnAvancar: TButton;
    btnRetroceder: TButton;
    txtPagNav: TStaticText;
    qryCadastroIDITEM: TIntegerField;
    qryCadastroDESCITEM: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure actIncluirExecute(Sender: TObject);
    procedure actSalvarExecute(Sender: TObject);
  private
    FOffsetAtual: Integer;
    function CarregarLinhas(const AQuantidade: Integer = 8; const AOffset: Integer = 0): TfrmCadastroItens;
    procedure PodeEditar(const AEditar: Boolean);
    procedure LimparCampos;
  public
    { Public declarations }
  end;

var
  frmCadastroItens: TfrmCadastroItens;

implementation

uses
  untBancoDados;

{$R *.dfm}

procedure TfrmCadastroItens.actIncluirExecute(Sender: TObject);
begin
  inherited;
  PodeEditar(True);
  cdsCadastro.Append;
  nmbIDITEM.Value := -1;
  btnIncluir.Action := actSalvar;
end;

procedure TfrmCadastroItens.actSalvarExecute(Sender: TObject);
begin
  inherited;
  PodeEditar(False);
  TBancoDados.ConexaoBD.StartTransaction;
  try
//    qryCadastroIDITEM.ReadOnly := True;
    cdsCadastroDESCITEM.AsString := edtDESCITEM.Text;
    cdsCadastro.Post;
    TBancoDados.ConexaoBD.Commit;
  except
    on E: Exception do
    begin
      TBancoDados.ConexaoBD.Rollback;
      PodeEditar(True);
      Raise;
    end;
  end;
  btnIncluir.Action := actIncluir;
  LimparCampos;
  CarregarLinhas;
end;

procedure TfrmCadastroItens.LimparCampos;
begin
  nmbIDITEM.Clear;
  edtDESCITEM.Clear;
end;

function TfrmCadastroItens.CarregarLinhas(const AQuantidade: Integer; const AOffset: Integer): TfrmCadastroItens;
var
  Offset: Integer;
  PgAtual, TotalPG: Integer;
  Linha: TStrings;
begin
  grdRegistros.RowCount := 1;
  grdRegistros.RowCount := Min(cdsCadastro.RecordCount + 1, 8);
  Offset := FOffsetAtual + AOffset;
  cdsCadastro.RecNo := IfThen(not(cdsCadastro.IsEmpty), 1) + Ord(Offset);

  repeat
    Linha := TStringList.Create;
    Linha.Add('');
    Linha.Add(cdsCadastroIDITEM.AsString);
    Linha.Add(cdsCadastroDESCITEM.AsString);
    grdRegistros.Rows[Max(cdsCadastro.RecNo, 1)] := Linha;
  until (not(cdsCadastro.FindNext)) or ((cdsCadastro.RecNo - AOffset) = AQuantidade);

  PgAtual := Ceil(cdsCadastro.RecNo / 8);
  TotalPG := Ceil(cdsCadastro.RecordCount / 8);
  txtPagNav.Caption := Format('%d/%d', [PgAtual, TotalPG]);
  btnRetroceder.Enabled := PgAtual > 1;
  btnAvancar.Enabled := PgAtual < TotalPG;
  Result := Self;
end;

procedure TfrmCadastroItens.PodeEditar(const AEditar: Boolean);
begin
  nmbIDITEM.Enabled := AEditar;
  edtDESCITEM.Enabled := AEditar;
end;

procedure TfrmCadastroItens.FormCreate(Sender: TObject);
var
  Colunas: TStrings;
  Field: TField;
begin
  inherited;
  FOffsetAtual := 0;
  Colunas := TStringList.Create;
  Colunas.Add('');
  for Field in cdsCadastro.Fields do
  begin
    Colunas.Add(Field.DisplayLabel);
  end;
  grdRegistros.Rows[0] := Colunas;
  cdsCadastro.Open;
  CarregarLinhas;
end;

end.
