program MVVMDemo;

uses
  Vcl.Forms,
  uFrmMain in 'uFrmMain.pas' {Form1},
  uFrmInvoice in 'uFrmInvoice.pas' {frmInvoice};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TfrmInvoice, frmInvoice);
  Application.Run;
end.
