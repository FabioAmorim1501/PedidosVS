unit untFormCadastroPedido;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untFormCadastroBase, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Datasnap.Provider, FireDAC.Comp.DataSet, FireDAC.Comp.Client, System.Actions, Vcl.ActnList, Data.DB, Datasnap.DBClient,
  Vcl.StdCtrls, Vcl.Grids, Vcl.ExtCtrls, Vcl.NumberBox, Vcl.WinXPickers, Vcl.ComCtrls, Vcl.Mask;

type
  TfrmCadastroPedido = class(TfrmCadastroBase)
    lblNUMERO: TLabel;
    nmbNUMERO: TNumberBox;
    lblDATAEMISSAO: TLabel;
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
    edtDATAEMISSAO: TMaskEdit;
    procedure actIncluirExecute(Sender: TObject);
    procedure actAdicionarItemExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cdsCadastroCalcFields(DataSet: TDataSet);
    procedure nmbIDITEMChange(Sender: TObject);
  private
    procedure PodeEditar(const APodeEditar: Boolean);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroPedido: TfrmCadastroPedido;

implementation

uses
  untBancoDados, untAuxiliar, untModel;

{$R *.dfm}

procedure TfrmCadastroPedido.actAdicionarItemExecute(Sender: TObject);
begin
  inherited;
  TBancoDados.IniciarTransacao;
  cdsCadastro.Append;
  try
    cdsCadastroIDPEDIDOCAB.Value := cdsPedidoIDPEDIDOCAB.Value;
    cdsCadastroIDITEM.Value := nmbIDITEM.ValueInt;
    cdsCadastroQUANTIDADE.Value := nmbQUANTIDADE.ValueFloat;
    cdsCadastroVALORUNIT.Value := nmbVALORUNIT.ValueFloat;
    cdsCadastroVALORTOTAL.Value := nmbVALORTOTAL.ValueFloat;
    cdsCadastro.Post;
    cdsCadastro.ApplyUpdates(-1);
    TBancoDados.Commit;
  except
    on E: Exception do
    begin
      TBancoDados.Rollback;
      cdsCadastro.Cancel;
    end;
  end;
end;

procedure TfrmCadastroPedido.actIncluirExecute(Sender: TObject);
var
  QryNumero: TFDQuery;
begin
  PodeClicarBtn(False);
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
  cdsCadastroDESCITEM.AsString :=  Item.Descricao;
end;

procedure TfrmCadastroPedido.FormCreate(Sender: TObject);
begin
  PodeEditar(False);
  qryPedido := TBancoDados.CriarQueryConectada(qryPedido);
  cdsPedido.Open;
  edtDATAEMISSAO.Text := FormatDateTime('dd/MM/yyyy', Date);
  inherited;
  nmbNUMERO.Text := '';
  nmbIDITEM.Text := '';
  nmbQUANTIDADE.Text := '';
  nmbVALORUNIT.Text := '';
  nmbVALORTOTAL.Text := '';
  nmbValorTotalPedido.Text := '';
end;

procedure TfrmCadastroPedido.nmbIDITEMChange(Sender: TObject);
var
  item: TItem;
begin
  inherited;
  try
    Item := TItem.Create(nmbIDITEM.ValueInt);
  except
    on E: Exception do
    begin
      nmbIDITEM.SetFocus;
      Raise;
    end;
  end;
  edtDESCITEM.Text := Item.Descricao;
end;

procedure TfrmCadastroPedido.PodeEditar(const APodeEditar: Boolean);
begin
//  nmbNUMERO.Enabled := APodeEditar;
  edtDATAEMISSAO.Enabled := APodeEditar;
  edtCLIENTE.Enabled := APodeEditar;
  nmbIDITEM.Enabled := APodeEditar;
  nmbQUANTIDADE.Enabled := APodeEditar;
  nmbVALORUNIT.Enabled := APodeEditar;
  actAdicionarItem.Enabled := APodeEditar;
end;

end.
