unit untFormRelatorioPedidos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls, DB, Grids, DBGrids,
  StrUtils, DBClient, Provider, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, StdCtrls, Mask;

type
  TfrmLstPedidos = class(TForm)
    pnlFundo: TPanel;
    grdItensPedido: TDBGrid;
    qryPedidos: TFDQuery;
    pnlPedido: TPanel;
    grdPedidos: TDBGrid;
    qryItensPedido: TFDQuery;
    qryItensPedidoIDITEM: TIntegerField;
    qryItensPedidoDESCITEM: TStringField;
    qryItensPedidoQUANTIDADE: TFloatField;
    qryItensPedidoVALORUNIT: TFloatField;
    qryItensPedidoVALORTOTAL: TFloatField;
    qryPedidosIDPEDIDOCAB: TIntegerField;
    qryPedidosDTEMISSAO: TDateField;
    qryPedidosNUMERO: TIntegerField;
    qryPedidosCLIENTE: TStringField;
    dsItensPedido: TDataSource;
    dsPedidos: TDataSource;
    btnFiltrar: TButton;
    lblFiltroData: TLabel;
    edtDTEmissaoAte: TMaskEdit;
    lblDTEmissaoAte: TLabel;
    edtDTEmissaoDe: TMaskEdit;
    lblFiltroCliente: TLabel;
    edtFiltroItem: TEdit;
    lblFiltroItem: TLabel;
    edtFiltroCliente: TEdit;
    procedure btnFiltrarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLstPedidos: TfrmLstPedidos;

implementation

uses
  untBancoDados;

{$R *.dfm}

procedure TfrmLstPedidos.btnFiltrarClick(Sender: TObject);
var
  DataDe, DataAte: String;
begin
  DataDe := IfThen(Trim(StringReplace(edtDTEmissaoDe.Text, '/', '', [rfReplaceAll])) <> '', edtDTEmissaoDe.Text);
  DataAte := IfThen(Trim(StringReplace(edtDTEmissaoAte.Text, '/', '', [rfReplaceAll])) <> '', edtDTEmissaoAte.Text);

  qryPedidos.SQL.Text := 'SELECT * FROM PEDIDOCAB P WHERE TRUE ';
  if((DataDe <> '') or (DataAte <> ''))then
    qryPedidos.SQL.Add('AND (P.DTEMISSAO >= :DTDE AND P.DTEMISSAO <= :DTATE) ');
  if (DataDe <> '') then
    qryPedidos.ParamByName('DTDE').AsDate := StrToDate(DataDe);
  if (DataAte <> '') then
    qryPedidos.ParamByName('DTATE').AsDate := StrToDate(DataAte);
  if(Trim(edtFiltroCliente.Text)<> '')then
  begin
    qryPedidos.SQL.Add('AND (P.CLIENTE LIKE :CLIENTE) ');
    qryPedidos.ParamByName('CLIENTE').AsString := '%' + Trim(edtFiltroCliente.Text) + '%';
  end;
  if(Trim(edtFiltroItem.Text) <> '' )then
  begin
    qryPedidos.SQL.Add('   AND (EXISTS (SELECT I.IDITEM                                   '
                      +'                  FROM ITEM I                                     '
                      +'                 INNER JOIN PEDIDOITEM PI ON PI.IDITEM = I.IDITEM '
                      +'                 WHERE PI.IDPEDIDOCAB = P.IDPEDIDOCAB             '
                      +'                   AND I.DESCITEM LIKE :DESCITEM))                ');
    qryPedidos.ParamByName('DESCITEM').AsString := '%' + Trim(edtFiltroItem.Text) + '%';
  end;
  qryPedidos.Open;
  qryItensPedido.Open;
end;

procedure TfrmLstPedidos.FormCreate(Sender: TObject);
begin
  qryPedidos := TBancoDados.CriarQueryConectada(qryPedidos);
  qryItensPedido := TBancoDados.CriarQueryConectada(qryItensPedido);
end;

end.
