unit viewModel.Invoice;

interface
uses
  Model.Invoice;

Type
  TInvoiceViewModel = class(TObject)
    private
      fInvoice : TInvoice;
    public
      procedure AddCompany(aName : string);
      function AddLine (aQty : integer; aDesc : string; aPrice : double) : string;
      procedure saveToFile(aFileName : string);
      constructor Create(aInvoiceNo : String); reintroduce;
      destructor Destroy; Override;
  end;

implementation

uses
  System.Classes, system.SysUtils;

{ TInvoiceViewModel }


procedure TInvoiceViewModel.AddCompany(aName: string);
begin
  //This is just passing through to the Model
  self.fInvoice.Company := aName;
end;

function TInvoiceViewModel.AddLine(aQty: integer; aDesc: string;
  aPrice: double): string;
var
  tot : Double;
begin
  //Add a line to the model
  tot :=  self.fInvoice.AddLine(aQty, aDesc, aPrice);
  //and the viewmodel also knows hor to format it
  result := aQty.ToString + ' - ' +  aDesc + ' - ' + aPrice.ToString + ' : ' + format('%.2f',[  tot]);
end;


constructor TInvoiceViewModel.Create(aInvoiceNo: String);
begin
//  once the viewModel is created, also create a model
  fInvoice := TInvoice.Create(aInvoiceNo);
end;

destructor TInvoiceViewModel.Destroy;
begin
  //and free the model
  fInvoice.Free;
  inherited;
end;

procedure TInvoiceViewModel.saveToFile(aFileName: string);
var
  sl : TStringList;
  aInvLine : TInvoiceLine;
  tot : Double;
begin
  //Saving a model to a file involves some logic, which is why its here
  //One could argue if this belongs in the Model, but saving to a file can
  //be regarded as UserInterface
  sl := TStringList.Create;
  try
    sl.Add(self.fInvoice.Company);
    sl.Add(self.fInvoice.InvoiceNo);
    for aInvLine in self.fInvoice.Lines do
    begin
      tot := aInvLine.TotalPrice;
      sl.Add( aInvLine.Qty.ToString + ' - ' +  aInvLine.Description + ' - ' + aInvLine.Price.ToString + ' : ' + tot.ToString)
    end;
    sl.SaveToFile(aFileName, TEncoding.UTF8);
  finally
    sl.Free;
  end;
end;

end.
