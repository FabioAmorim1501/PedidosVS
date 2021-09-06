unit untFormCadastroPedido;

interface

uses
  Winapi.Windows, Winapi.Messages, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untFormCadastroBase, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Datasnap.Provider, FireDAC.Comp.DataSet, FireDAC.Comp.Client, System.Actions, Vcl.ActnList, Data.DB, Datasnap.DBClient,
  Vcl.StdCtrls, Vcl.Grids, Vcl.ExtCtrls, Vcl.NumberBox, Vcl.WinXPickers, Vcl.ComCtrls, Vcl.Mask,
  untModel;

type
  TfrmCadastroPedido = class(TfrmCadastroBase)
    lblNUMERO: TLabel;
    nmbNUMERO: TNumberBox;
    lblDTEMISSAO: TLabel;
    lblCLIENTE: TLabel;
    edtCLIENTE: TEdit;
    pnlItem: TPanel;
    lblIDITEM: TLabel;
    nmbIDITEM: TNumberBox;
    lblLegendaBoxItem: TStaticText;
    lblDESCITEM: TLabel;
    edtDESCITEM: TEdit;
    nmbQUANTIDADE: TNumberBox;
    lblQUANTIDADE: TLabel;
    lblVALORUNIT: TLabel;
    nmbVALORUNIT: TNumberBox;
    lblVALORTOTAL: TLabel;
    nmbVALORTOTAL: TNumberBox;
    nmbValorTotalPedido: TNumberBox;
    lblValorTotalPedido: TLabel;
    btnAdicionarItem: TButton;
    actAdicionarItem: TAction;
    cdsPedido: TClientDataSet;
    qryPedido: TFDQuery;
    dspPedido: TDataSetProvider;
    qryCadastroIDPEDIDOITEM: TIntegerField;
    qryCadastroIDPEDIDOCAB: TIntegerField;
    qryCadastroIDITEM: TIntegerField;
    qryCadastroQUANTIDADE: TFloatField;
    qryCadastroVALORUNIT: TFloatField;
    qryCadastroVALORTOTAL: TFloatField;
    cdsCadastroIDPEDIDOITEM: TIntegerField;
    cdsCadastroIDPEDIDOCAB: TIntegerField;
    cdsCadastroIDITEM: TIntegerField;
    cdsCadastroQUANTIDADE: TFloatField;
    cdsCadastroVALORUNIT: TFloatField;
    cdsCadastroVALORTOTAL: TFloatField;
    cdsCadastroDESCITEM: TStringField;
    cdsPedidoIDPEDIDOCAB: TIntegerField;
    cdsPedidoDTEMISSAO: TDateField;
    cdsPedidoNUMERO: TIntegerField;
    cdsPedidoCLIENTE: TStringField;
    qryPedidoIDPEDIDOCAB: TIntegerField;
    qryPedidoDTEMISSAO: TDateField;
    qryPedidoNUMERO: TIntegerField;
    qryPedidoCLIENTE: TStringField;
    edtDTEMISSAO: TMaskEdit;
    cdsCadastroSOMA_VALORTOTAL: TAggregateField;
    procedure actIncluirExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cdsCadastroCalcFields(DataSet: TDataSet);
    procedure nmbIDITEMChange(Sender: TObject);
    procedure edtDTEMISSAOEnter(Sender: TObject);
    procedure edtDTEMISSAOExit(Sender: TObject);
    procedure edtCLIENTEEnter(Sender: TObject);
    procedure edtCLIENTEExit(Sender: TObject);
    procedure cdsPedidoAfterPost(DataSet: TDataSet);
    procedure actAdicionarItemExecute(Sender: TObject);
    procedure CalcValorTotalOnChange(Sender: TObject);
  private
    FPedidoItem: TPedidoItem;
    procedure PodeEditar(const APodeEditar: Boolean);
    { Private declarations }
  public
    { Public declarations }
  end;

  const
    FormCaption = 'Cadastro de Pedido';

var
  frmCadastroPedido: TfrmCadastroPedido;

implementation

uses
  untBancoDados, untAuxiliar, System.SysUtils;

{$R *.dfm}

procedure TfrmCadastroPedido.FormCreate(Sender: TObject);
begin
  FPedidoItem := nil;
  PodeEditar(False);
  qryPedido := TBancoDados.CriarQueryConectada(qryPedido);
  cdsPedido.Open;
  edtDTEMISSAO.Text := FormatDateTime('dd/MM/yyyy', Date);
  inherited;
  nmbNUMERO.Text := '';
  nmbIDITEM.Text := '';
  nmbQUANTIDADE.Text := '';
  nmbVALORUNIT.Text := '';
  nmbVALORTOTAL.Text := '';
  nmbValorTotalPedido.Text := '';
end;

procedure TfrmCadastroPedido.actAdicionarItemExecute(Sender: TObject);
begin
  cdsCadastro.Append;
  try
    cdsCadastroIDPEDIDOCAB.Value := cdsPedidoIDPEDIDOCAB.Value;
    cdsCadastroIDITEM.Value := nmbIDITEM.ValueInt;
    cdsCadastroQUANTIDADE.Value := nmbQUANTIDADE.ValueFloat;
    cdsCadastroVALORUNIT.Value := nmbVALORUNIT.ValueFloat;
    cdsCadastroVALORTOTAL.Value := nmbVALORTOTAL.ValueFloat;
    cdsCadastro.Post;
    cdsCadastro.ApplyUpdates(-1);
  except
    on E: Exception do
    begin
      cdsCadastro.Cancel;
    end;
  end;
  CarregarLinhas;
end;

procedure TfrmCadastroPedido.actIncluirExecute(Sender: TObject);
var
  QryNumero: TFDQuery;
begin
  TBancoDados.IniciarTransacao;
  PodeAgir(False);
  PodeEditar(True);
  cdsPedido.Append;
  QryNumero := TBancoDados.CriarQueryConectada;
  try
    QryNumero.SQL.Text := 'SELECT MAX(NUMERO) AS MAX_NUM FROM PEDIDOCAB';
    QryNumero.Open;
    if (not(QryNumero.IsEmpty)) then
      nmbNUMERO.ValueInt := QryNumero.FieldByName('MAX_NUM').AsInteger + 1;
  finally
    QryNumero.Free;
  end;
  cdsPedidoNUMERO.Value := nmbNUMERO.ValueInt;
  cdsPedidoDTEMISSAO.Value := StrToDate(edtDTEMISSAO.Text);
  cdsPedido.Post;
  cdsPedido.ApplyUpdates(-1);
  cdsPedido.Refresh;
  btnIncluir.Action := actSalvar;
  btnAlterar.Action := actCancelar;
  edtCLIENTE.SetFocus;
end;

procedure TfrmCadastroPedido.cdsCadastroCalcFields(DataSet: TDataSet);
var
  Item: TItem;
begin
  inherited;
  Item := TItem.Create(cdsCadastroIDITEM.Value);
  try
    cdsCadastroDESCITEM.AsString := Item.Descricao;
  finally
    Item.Free;
  end;
end;

procedure TfrmCadastroPedido.cdsPedidoAfterPost(DataSet: TDataSet);
begin
  inherited;
  if(cdsPedidoIDPEDIDOCAB.Value <> 0)then
    Caption := Format('%s - %d', [FormCaption, cdsPedidoIDPEDIDOCAB.Value])
  else
    Caption := FormCaption;
end;

procedure TfrmCadastroPedido.edtCLIENTEEnter(Sender: TObject);
begin
  inherited;
  cdsPedido.Edit;
end;

procedure TfrmCadastroPedido.edtCLIENTEExit(Sender: TObject);
begin
  inherited;
  cdsPedidoCLIENTE.AsString := edtCLIENTE.Text;
  cdsPedido.Post;
end;

procedure TfrmCadastroPedido.edtDTEMISSAOEnter(Sender: TObject);
begin
  inherited;
  cdsPedido.Edit;
end;

procedure TfrmCadastroPedido.edtDTEMISSAOExit(Sender: TObject);
begin
  inherited;
  cdsPedidoDTEMISSAO.Value := StrToDate(edtDTEMISSAO.Text);
  cdsPedido.Post;
end;

procedure TfrmCadastroPedido.nmbIDITEMChange(Sender: TObject);
begin
  inherited;
  try
    if(FPedidoItem = nil)then
      FPedidoItem := TPedidoItem.Create;
    FPedidoItem.Item(TItem.Create(nmbIDITEM.ValueInt));
  except
    on E: Exception do
    begin
      nmbIDITEM.SetFocus;
      Raise;
    end;
  end;
  edtDESCITEM.Text := FPedidoItem.Item.Descricao;
end;

procedure TfrmCadastroPedido.CalcValorTotalOnChange(Sender: TObject);
begin
  nmbVALORTOTAL.Value := nmbQUANTIDADE.Value * nmbVALORUNIT.Value;
end;

procedure TfrmCadastroPedido.PodeEditar(const APodeEditar: Boolean);
begin
//  nmbNUMERO.Enabled := APodeEditar;
  edtDTEMISSAO.Enabled := APodeEditar;
  edtCLIENTE.Enabled := APodeEditar;
  nmbIDITEM.Enabled := APodeEditar;
  nmbQUANTIDADE.Enabled := APodeEditar;
  nmbVALORUNIT.Enabled := APodeEditar;
  actAdicionarItem.Enabled := APodeEditar;
end;

end.
