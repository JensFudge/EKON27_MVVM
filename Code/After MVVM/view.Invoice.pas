unit view.Invoice;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, ViewModel.Invoice;

type
  TfrmInvoice = class(TForm)
    lblInvoiceNo: TLabel;
    Label1: TLabel;
    edCustomer: TEdit;
    mmoInvoice: TMemo;
    edQty: TEdit;
    edDescription: TEdit;
    edPrice: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Button1: TButton;
    btnSave: TButton;
    sd: TSaveDialog;

    procedure Button1Click(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edCustomerChange(Sender: TObject);
  private
    { Private declarations }
    fViewModel : TInvoiceViewModel;
    FInvNumber: string;
    procedure SetInvNumber(const Value: string);

  public
    { Public declarations }
    Property InvNumber : string read FInvNumber write SetInvNumber;
  end;

var
  frmInvoice: TfrmInvoice;

implementation

{$R *.dfm}

procedure TfrmInvoice.btnSaveClick(Sender: TObject);
begin
  //It could be argued if the userinterface has a saveDialog, but in this case it has
    if sd.Execute then
    begin
      if not assigned(self.fViewModel) then
        self.fViewModel := TInvoiceViewModel.create(self.FInvNumber);
      //Actual code, doing something, is on the viewmodel
      self.fViewModel.saveToFile(sd.FileName);
      self.Close;
    end
end;

procedure TfrmInvoice.Button1Click(Sender: TObject);
var
  qty : integer;
  price : double;
  s : string;
begin
  if not assigned(fViewModel) then
    fViewModel := TInvoiceViewModel.Create(self.FInvNumber);
  //converting types from strings is a UI thing
  qty := StrToIntDef(edQty.Text, 0);
  price := StrToFloatDef(edPrice.Text, 0);
  //adding the line is on the viewmodel
  s := fViewModel.AddLine(qty, edDescription.Text, price);
  //that returns a bit of UI
  mmoInvoice.Lines.Add(s);
  self.edQty.Text := '';
  self.edDescription.Text := '';
  self.edPrice.Text := '';
end;

procedure TfrmInvoice.edCustomerChange(Sender: TObject);
begin
  if not assigned(fViewModel) then
    fViewModel := TInvoiceViewModel.Create(self.FInvNumber);
    //adding a companyname to the model is done via the viewmodel
  fViewModel.AddCompany(edCustomer.Text);
end;

procedure TfrmInvoice.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  self.mmoInvoice.Lines.Clear;
  self.lblInvoiceNo.Caption := '';
  self.edCustomer.Text := '';
  self.edQty.Text := '';
  self.edDescription.Text := '';
  self.edPrice.Text := '';
  if assigned(self.fViewModel) then
    self.fViewModel.Free;
  self.fViewModel := nil;
end;

procedure TfrmInvoice.SetInvNumber(const Value: string);
begin
  FInvNumber := Value;
  self.lblInvoiceNo.Caption := 'Invoice : ' +value;
end;

end.
