unit Model.Invoice;

interface

uses
  System.Classes, generics.Collections;

Type
  TInvoiceLine = class(TObject)
    private
    FPrice: double;
    Fqty: integer;
    FDescription: string;
    function GetTotalPrice: double;
    procedure SetDescription(const Value: string);
    procedure SetPrice(const Value: double);
    procedure Setqty(const Value: integer);
    public
      property qty : integer read Fqty write Setqty;
      property Description : string read FDescription write SetDescription;
      property Price : double read FPrice write SetPrice;
      // TotalPrice is readonly and calculated
      property TotalPrice : double read GetTotalPrice;
  end;

  //Creating a class for the generic list will have an increase in performance
  //of the project, as it only needs to be resolved at this point
  TInvoiceLines = class(TObjectList<TInvoiceLine>)
  end;

  TInvoice = class(TObject)
    private
    FInvoiceNo: string;
    FCompany: string;
    FLines: TInvoiceLines;
    procedure SetCompany(const Value: string);
    procedure SetInvoiceNo(const Value: string);
    public
      property InvoiceNo : string read FInvoiceNo write SetInvoiceNo;
      property Company : string read FCompany write SetCompany;
      property Lines : TInvoiceLines read FLines;
      Function AddLine(aQty : integer; aDesc : string; aPrice: Double) : Double;
      Constructor Create(aInvNumber : String);
      Destructor Destroy ; override;
  end;


implementation

{ TInvoiceLine }

//This is business logic and is now testable :-)
function TInvoiceLine.GetTotalPrice: double;
begin
  Result := fQty * FPrice;
end;

procedure TInvoiceLine.SetDescription(const Value: string);
begin
  FDescription := Value;
end;

procedure TInvoiceLine.SetPrice(const Value: double);
begin
  FPrice := Value;
end;

procedure TInvoiceLine.Setqty(const Value: integer);
begin
  Fqty := Value;
end;

{ TInvoice }

//for the sake of ease, I return the totalamount to the user of the function
function TInvoice.AddLine(aQty: integer; aDesc: string; aPrice: Double): Double;
begin
  var InvoiceLine := TInvoiceLine.Create;
  InvoiceLine.FPrice := aPrice;
  InvoiceLine.Fqty := aQty;
  InvoiceLine.FDescription := aDesc;
  Result := InvoiceLine.TotalPrice;
  self.Lines.Add(InvoiceLine);
end;

constructor TInvoice.Create(aInvNumber: String);
begin
  FLines := TInvoiceLines.Create;
  FInvoiceNo := aInvNumber;
end;

destructor TInvoice.Destroy;
begin
  FLInes.Free;
  inherited;
end;

procedure TInvoice.SetCompany(const Value: string);
begin
  FCompany := Value;
end;

procedure TInvoice.SetInvoiceNo(const Value: string);
begin
  FInvoiceNo := Value;
end;


end.
