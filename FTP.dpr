program FTP;

uses
  Vcl.Forms,
  uFrmFTP in 'uFrmFTP.pas' {frmFTP},
  uClasseFTP in 'uClasseFTP.pas',
  uClasseUtils in 'uClasseUtils.pas',
  uThreadFTP in 'uThreadFTP.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmFTP, frmFTP);
  ReportMemoryLeaksOnShutdown := True;
  Application.Run;
end.
