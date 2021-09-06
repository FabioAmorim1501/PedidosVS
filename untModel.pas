unit untModel;

interface

type
  TBDItem = class(TObject)
  private
    FId: Integer;
  public
    constructor Create; overload; virtual;
    constructor Create(const AId: Integer); overload; virtual;

    function Id: Integer; overload; virtual;
    function Id(const AId: Integer): TBDItem; overload; virtual;

    destructor Destroy; override;
  end;

  TItem = class(TBDItem)
  private
    FDescricao: String;
    function CarregarBD: TItem;
  public
    constructor Create; overload; override;
    constructor Create(const AId: Integer; const ADescricao: String); overload;
    constructor Create(const AId: Integer; const ACarregarBD: Boolean = True); overload;

    function Descricao: String; overload;
    function Descricao(const ADescricao: String): TItem; overload;

    destructor Destroy; override;
  end;

  TPedidoCAB = class(TBDItem)
  private
    FDataEmissao: TDate;
    FNumero: Integer;
    FCliente: String;
  public
    constructor Create; overload; override;
    constructor Create(const AId: Integer; const ADataEmissao: TDate; const ANumero: Integer;
      const ACliente: String); overload;

    function DataEmissao: TDate; overload;
    function Numero: Integer; overload;
    function Cliente: String; overload;
    function DataEmissao(const ADataEmissao: TDate): TPedidoCAB; overload;
    function Numero(const ANumero: Integer): TPedidoCAB; overload;
    function Cliente(const ACliente: String): TPedidoCAB; overload;

    destructor Destroy; override;
  end;

  TPedidoItem = class(TBDItem)
  private
    FPedido: TPedidoCAB;
    FItem: TItem;
    FQuantidade: Double;
    FValorUnit: Double;
    FValorTotal: Double;
  public
    constructor Create; overload; override;
    constructor Create(const AId: Integer; const APedido: TPedidoCAB; const AItem: TItem;
      AQuantidade, AValorUnit, AValorTotal: Double); overload;

    function Pedido: TPedidoCAB; overload;
    function Item: TItem; overload;
    function Quantidade: Double; overload;
    function ValorUnit: Double; overload;
    function ValorTotal: Double; overload;
    function Pedido(const APedido: TPedidoCAB): TPedidoItem; overload;
    function Item(const AItem: TItem): TPedidoItem; overload;
    function Quantidade(const AQuantidade: Double): TPedidoItem; overload;
    function ValorUnit(const AValorUnit: Double): TPedidoItem; overload;
    function ValorTotal(const AValorTotal: Double): TPedidoItem; overload;

    destructor Destroy; override;
  end;

implementation

uses
  SysUtils, DB, FireDAC.Comp.Client, untBancoDados;

{ TBDItem }

constructor TBDItem.Create;
begin
  inherited Create;
  FId := 0;
end;

constructor TBDItem.Create(const AId: Integer);
begin
  Create;
  FId := AId;
end;

destructor TBDItem.Destroy;
begin
  FId := 0;
  Self := nil;
end;

function TBDItem.Id: Integer;
begin
  Result := FId;
end;

function TBDItem.Id(const AId: Integer): TBDItem;
begin
  FId := AId;
  Result := Self;
end;

{ TItem }

constructor TItem.Create;
begin
  inherited Create;
  FDescricao := '';
end;

constructor TItem.Create(const AId: Integer; const ADescricao: String);
begin
  inherited Create(AId);
  FDescricao := ADescricao;
end;

function TItem.Descricao: String;
begin
  Result := FDescricao;
end;

constructor TItem.Create(const AId: Integer; const ACarregarBD: Boolean);
begin
  inherited Create(AId);
  try
    if((AId > 0)and(ACarregarBD))then
      CarregarBD;
  except
    on E:Exception do
    begin
      Free;
      Raise;
    end;
  end;
end;

function TItem.CarregarBD: TItem;
var
  QryDescItem: TFDQuery;
begin
  QryDescItem := TBancoDados.CriarQueryConectada;
  try
    QryDescItem.Open('SELECT DESCITEM FROM ITEM WHERE IDITEM = :IDITEM',[FId]);
    if(not(QryDescItem.IsEmpty))then
      FDescricao :=  QryDescItem.FieldByName('DESCITEM').AsString;
  finally
    QryDescItem.Free;
  end;
  Result := Self;
end;

function TItem.Descricao(const ADescricao: String): TItem;
begin
  FDescricao := ADescricao;
  Result := Self;
end;

destructor TItem.Destroy;
begin
  FDescricao := '';
  inherited Destroy;
end;

{ TPedidoCAB }

constructor TPedidoCAB.Create;
begin
  inherited Create;
  FDataEmissao := 0;
  FNumero := 0;
  FCliente := '';
end;

constructor TPedidoCAB.Create(const AId: Integer; const ADataEmissao: TDate; const ANumero: Integer;
  const ACliente: String);
begin
  inherited Create(AId);
  FDataEmissao := ADataEmissao;
  FNumero := ANumero;
  FCliente := ACliente;
end;

function TPedidoCAB.Cliente: String;
begin
  Result := FCliente;
end;

function TPedidoCAB.Cliente(const ACliente: String): TPedidoCAB;
begin
  FCliente := ACliente;
  Result := Self;
end;

function TPedidoCAB.DataEmissao(const ADataEmissao: TDate): TPedidoCAB;
begin
  FDataEmissao := ADataEmissao;
  Result := Self;
end;

destructor TPedidoCAB.Destroy;
begin
  FDataEmissao := 0;
  FNumero := 0;
  FCliente := '';
  inherited Destroy;
end;

function TPedidoCAB.DataEmissao: TDate;
begin
  Result := FDataEmissao;
end;

function TPedidoCAB.Numero: Integer;
begin
  Result := FNumero;
end;

function TPedidoCAB.Numero(const ANumero: Integer): TPedidoCAB;
begin
  FNumero := ANumero;
  Result := Self;
end;

{ TPedidoItem }

constructor TPedidoItem.Create;
begin
  inherited Create;
  FPedido := TPedidoCAB.Create;
  FItem := TItem.Create;
  FQuantidade := 0;
  FValorUnit := 0;
  FValorTotal := 0;
end;

constructor TPedidoItem.Create(const AId: Integer; const APedido: TPedidoCAB; const AItem: TItem;
  AQuantidade, AValorUnit, AValorTotal: Double);
begin
  inherited Create(AId);
  FPedido := APedido;
  FItem := AItem;
  FQuantidade := AQuantidade;
  FValorUnit := AValorUnit;
  FValorTotal := AValorTotal;
end;

function TPedidoItem.Item: TItem;
begin
  Result := FItem;
end;

function TPedidoItem.Pedido: TPedidoCAB;
begin
  Result := FPedido;
end;

function TPedidoItem.Quantidade: Double;
begin
  Result := FQuantidade;
end;

function TPedidoItem.ValorTotal: Double;
begin
  Result := FValorTotal;
end;

function TPedidoItem.ValorUnit: Double;
begin
  Result := FValorUnit;
end;

destructor TPedidoItem.Destroy;
begin
  FPedido.Free;
  FItem.Free;
  FQuantidade := 0;
  FValorUnit := 0;
  FValorTotal := 0;
  inherited Destroy;
end;

function TPedidoItem.Item(const AItem: TItem): TPedidoItem;
begin
  FItem := AItem;
  Result := Self;
end;

function TPedidoItem.Pedido(const APedido: TPedidoCAB): TPedidoItem;
begin
  FPedido := APedido;
  Result := Self;
end;

function TPedidoItem.Quantidade(const AQuantidade: Double): TPedidoItem;
begin
  FQuantidade := AQuantidade;
  Result := Self;
end;

function TPedidoItem.ValorTotal(const AValorTotal: Double): TPedidoItem;
begin
  FValorTotal := AValorTotal;
  Result := Self;
end;

function TPedidoItem.ValorUnit(const AValorUnit: Double): TPedidoItem;
begin
  FValorUnit := AValorUnit;
  Result := Self;
end;

end.
