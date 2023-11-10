program BuildMVVMAfter;

uses
  Vcl.Forms,
  uFrmMain in 'uFrmMain.pas' {Form1},
  view.Invoice in 'view.Invoice.pas' {frmInvoice},
  Model.Invoice in 'Model.Invoice.pas',
  viewModel.Invoice in 'viewModel.Invoice.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TfrmInvoice, frmInvoice);
  Application.Run;
end.
