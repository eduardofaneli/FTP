unit uThreadFTP;

interface

uses
  Vcl.ExtCtrls, Vcl.StdCtrls, System.Classes, System.SysUtils, Vcl.Forms, Winapi.Windows, Vcl.ComCtrls, System.Variants, IdFtp;

type
  TThreadFTP = class(TThread)
    private
      FFtp : TIdFTP;
      FFilePath, FFtpPath, FFileName : TFileName;

    {Private Declarations}
    protected
      procedure Execute; override;

      procedure PutFile;
    {Protected Declarations}
    public
      constructor Create(var AFtp: TIdFTP; AFilePath, AFtpPath, AFileName: TFileName);

    {Public Declarations}

  end;

implementation

uses
  uClasseFTP, uFrmFTP;

{ TThreadFTP }

constructor TThreadFTP.Create(var AFtp: TIdFTP; AFilePath, AFtpPath, AFileName: TFileName);
begin
  inherited Create(False);
  FreeOnTerminate := True;

  FFtp      := AFtp;
  FFilePath := AFilePath;
  FFtpPath  := AFtpPath;
  FFileName := AFileName;

end;

procedure TThreadFTP.Execute;
begin
  inherited;
  PutFile;
end;

procedure TThreadFTP.PutFile;
begin
  try
    if FFtp.Connected then
    begin

      FFtp.ChangeDir(FFtpPath);
      FFtp.Put(FFilePath, FFileName);

    end;
  except
    on e: Exception do
  end;
end;

end.

