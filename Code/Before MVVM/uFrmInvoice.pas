unit uFrmInvoice;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmInvoice: TfrmInvoice;

implementation

{$R *.dfm}

procedure TfrmInvoice.btnSaveClick(Sender: TObject);
begin
  if sd.Execute then
  begin
    mmoInvoice.Lines.Insert(0, edCustomer.text);
    mmoInvoice.Lines.Insert(0, lblInvoiceNo.Caption);
    mmoInvoice.Lines.SaveToFile(sd.FileName);
    self.Close;
  end;
end;

procedure TfrmInvoice.Button1Click(Sender: TObject);
var
  qty : integer;
  price, tot : double;
begin
  qty := StrToIntDef(edQty.Text, 0);
  price := StrToFloatDef(edPrice.Text, 0);
  tot := qty * price;
  mmoInvoice.Lines.Add( edQty.Text + ' - ' +  edDescription.Text + ' - ' + edPrice.Text + ' : ' + tot.ToString);
  self.edQty.Text := '';
  self.edDescription.Text := '';
  self.edPrice.Text := '';
end;

procedure TfrmInvoice.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  self.mmoInvoice.Lines.Clear;
  self.lblInvoiceNo.Caption := '';
  self.edCustomer.Text := '';
  self.edQty.Text := '';
  self.edDescription.Text := '';
  self.edPrice.Text := '';
end;

end.
