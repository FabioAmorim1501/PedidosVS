unit untBancoDados;

interface

uses
  Classes, FireDAC.Comp.Client;

type
  TBancoDados = class(TPersistent)
  private
    class var FConexaoBD: TFDConnection;
  public
    class function ConexaoBD: TFDConnection;
  end;

implementation

uses
  Forms;

{ TBancoDados }

class function TBancoDados.ConexaoBD: TFDConnection;
begin
  if not(Assigned(FConexaoBD)) then
  begin
    FConexaoBD := TFDConnection.Create(Application);
    FConexaoBD.ConnectionName := 'pedidosvs';
    FConexaoBD.Connected := True;
  end;
  Result := FConexaoBD;
end;

initialization

RegisterClass(TBancoDados);

end.
