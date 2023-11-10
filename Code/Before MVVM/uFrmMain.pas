unit uFrmMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    EdInvoiceNumber: TEdit;
    btnCreate: TButton;
    Label1: TLabel;
    procedure btnCreateClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses uFrmInvoice;


procedure TForm1.btnCreateClick(Sender: TObject);
begin
  if EdInvoiceNumber.Text <> '' then
  begin
     frmInvoice.lblInvoiceNo.Caption := 'Invoice : ' + edInvoiceNumber.Text;
     frmInvoice.mmoInvoice.Lines.Clear;
     frminvoice.ShowModal;
  end;

end;

end.
