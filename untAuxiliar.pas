unit untAuxiliar;

interface

uses
   DBClient, Grids;

procedure CarregarCabecalho(const ACds: TClientDataSet; const AGrd: TStringGrid);

implementation

uses
  Classes, DB;

procedure CarregarCabecalho(const ACds: TClientDataSet; const AGrd: TStringGrid);
var
  Colunas: TStrings;
  Field: TField;
begin
  Colunas := TStringList.Create;
  Colunas.Add('');
  AGrd.ColCount := 1;
  for Field in ACds.Fields do
  begin
    if(Field.Visible)then
    begin
      Colunas.Add(Field.DisplayLabel);
      AGrd.ColCount := AGrd.ColCount + 1;
      AGrd.ColWidths[AGrd.ColCount - 1] := Field.DisplayWidth * AGrd.Font.Size;
    end;
  end;
  AGrd.Rows[0] := Colunas;
  ACds.Open;
end;

end.
