unit uClasseFTP;

interface

uses
  IdContext, IdBaseComponent, IdComponent, IdCustomTCPServer, IdTCPServer,
  IdCmdTCPServer, IdAntiFreezeBase, IdAntiFreeze, IdFTPList, IdAllFTPListParsers,
  IdExplicitTLSClientServerBase, IdFTPServer, Vcl.ExtCtrls, Vcl.StdCtrls,
  IdTCPConnection, IdTCPClient, IdFTP,
  System.Classes, System.SysUtils, Vcl.Forms, Winapi.Windows, Vcl.ComCtrls,
  System.Variants, IdFTPCommon, System.Generics.Collections, Vcl.Dialogs, uThreadFTP;

type
  TFtp = class
  private
    FIdFTP: TIdFTP;
    FProxy: TIdFtpProxySettings;
    FNoProxy: TIdFtpProxySettings;
    FTimer: TTimer;
    FThreadFTP : TThreadFTP;
    FProgressBar: TProgressBar;
    FTransferLabel: TLabel;
    FMemoLog: TMemo;
    FStatusBar: TStatusBar;

    procedure FtpWork(ASender: TObject; AWorkMode: TWorkMode; AWorkCount: Int64);
    procedure FtpWorkBegin(ASender: TObject; AWorkMode: TWorkMode; AWorkCountMax: Int64);
    procedure FtpWorkEnd(ASender: TObject; AWorkMode: TWorkMode);

    { Private declarations }
  public
    constructor Create();
    destructor Destroy; override;

    procedure Config(AHost, AUsername, APassword: String; APort: Integer;
      APassive, AUseProxy: Boolean);
    procedure ConfigProxy(AHost, AUsername, APassword: String; APort: Integer);
    procedure CreateTimer;
    procedure GetOnTimer(Snder: TObject);

    function TestConnection(AFTPPath: TFileName;
      out AMessageException: String): Boolean;
    function Connect(AFTPPath: TFileName;
      out AMessageException: String): Boolean;
    function Disconnect(out AMessageException: String): Boolean;
    function SendFile(AFTPPath, AFilePath, AFileName: TFileName;
      out AMessageException: String): Boolean;
    function ReceiveFile(AFTPPath, AFilePath, AFileName: TFileName;
      out AMessageException: String): Boolean;
    property TransferProgressBar : TProgressBar read FProgressBar write FProgressBar;
    property TransferLabel : TLabel read FTransferLabel write FTransferLabel;
    property MemoLog : TMemo read FMemoLog write FMemoLog;
    property StatusBar : TStatusBar read FStatusBar write FStatusBar;
    { Public declarations }
  protected

    { Protected declarations }
  end;

implementation

uses
  uFrmFTP;

{$REGION 'Class TFtp'}
{ TFtp }

procedure TFtp.Config(AHost, AUsername, APassword: String; APort: Integer;
  APassive, AUseProxy: Boolean);
begin
  FIdFTP.Host := AHost;
  FIdFTP.Port := APort;
  FIdFTP.Username := AUsername;
  FIdFTP.Password := APassword;
  FIdFTP.Passive := APassive;
  if AUseProxy then
    FIdFTP.ProxySettings := FProxy
  else
    FIdFTP.ProxySettings := FNoProxy;
end;

procedure TFtp.ConfigProxy(AHost, AUsername, APassword: String; APort: Integer);
begin
  FProxy.Host := AHost;
  FProxy.Port := APort;
  FProxy.Username := AUsername;
  FProxy.Password := APassword;
end;

function TFtp.Connect(AFTPPath: TFileName;
  out AMessageException: String): Boolean;
begin
  try
    FIdFTP.Connect;
    FIdFTP.ChangeDir(AFTPPath);
    Result := FIdFTP.Connected;
  except
    on e: Exception do
    begin
      FIdFTP.Disconnect;
      AMessageException := e.Message;
      Result := False;
    end;
  end;
end;

constructor TFtp.Create();
begin
  inherited Create();

  FIdFTP := TIdFTP.Create();

  FIdFTP.OnWork      := FtpWork;
  FIdFTP.OnWorkBegin := FtpWorkBegin;
  FIdFTP.OnWorkEnd   := FtpWorkEnd;

  FIdFTP.TransferType := ftBinary;
  FIdFTP.TransferTimeout := 9999999999999999999;

  FProxy := TIdFtpProxySettings.Create;
  FNoProxy := FIdFTP.ProxySettings;

  CreateTimer;

end;

procedure TFtp.CreateTimer;
begin
  FTimer := TTimer.Create(nil);
  FTimer.Interval := 10000;
  FTimer.Enabled := False;
  FTimer.OnTimer := GetOnTimer;
end;

destructor TFtp.Destroy;
begin
  if not FIdFTP.Connected then
  begin
    FreeAndNil(FTimer);
    FreeAndNil(FIdFTP);
    FreeAndNil(FProxy);

    inherited Destroy;
  end;
end;

function TFtp.Disconnect(out AMessageException: String): Boolean;
begin
  try
    FIdFTP.Disconnect;
    Result := FIdFTP.Connected;
  except
    on e: Exception do
    begin
      AMessageException := e.Message;
      Result := False;
    end;
  end;
end;

procedure TFtp.FtpWork(ASender: TObject; AWorkMode: TWorkMode; AWorkCount: Int64);
var
  iSizeTransfered: Integer;
begin
  iSizeTransfered := AWorkCount div 1024;
  FTransferLabel.Caption := 'Transfered: ' + IntToStr(iSizeTransfered) + '/kb.';
  FProgressBar.Position := AWorkCount;
end;

procedure TFtp.FtpWorkBegin(ASender: TObject; AWorkMode: TWorkMode; AWorkCountMax: Int64);
begin
  FProgressBar.Max      := AWorkCountMax;
  FProgressBar.Position := 0;
  FMemoLog.Lines.Add('Sending file...');
end;

procedure TFtp.FtpWorkEnd(ASender: TObject; AWorkMode: TWorkMode);
begin
  FProgressBar.Position := FProgressBar.Max;
  FMemoLog.Lines.Add('File uploaded successfully!')
end;

procedure TFtp.GetOnTimer(Snder: TObject);
begin

  if FIdFTP.Connected then
    FStatusBar.Panels[1].Text := 'State: Connected'
  else if not FIdFTP.Connected then
    FStatusBar.Panels[1].Text := 'State: Discconnected';

end;

function TFtp.ReceiveFile(AFTPPath, AFilePath, AFileName: TFileName;
  out AMessageException: String): Boolean;
begin

  try
    Application.ProcessMessages;
    if FIdFTP.Connected then
    begin

      FProgressBar.State := pbsNormal;

      FIdFTP.Get(AFTPPath, AFilePath, False, False);

      Result := True;

      FProgressBar.State := pbsPaused;

    end;
  except
    on e: Exception do
    begin
      AMessageException := e.Message;
      FProgressBar.State := pbsError;
      Result := False;
    end;
  end;

end;

function TFtp.SendFile(AFTPPath, AFilePath, AFileName: TFileName;
  out AMessageException: String): Boolean;
begin

  try
    Application.ProcessMessages;
    if FIdFTP.Connected then
    begin

      FIdFTP.ChangeDir(AFtpPath);

      FThreadFTP := TThreadFTP.Create(FIdFTP, AFilePath, AFTPPath, AFileName);

      Result := True;
    end;
  except
    on e: Exception do
    begin
      AMessageException := e.Message;
      Result := False;
    end;
  end;

end;

function TFtp.TestConnection(AFTPPath: TFileName;
out AMessageException: String): Boolean;
begin
  try
    FIdFTP.Connect;
    FIdFTP.ChangeDir(AFTPPath);
    Result := FIdFTP.Connected;
    FIdFTP.Disconnect;
  except
    on e: Exception do
    begin
      FIdFTP.Disconnect;
      AMessageException := e.Message;
      Result := False;
    end;
  end;

end;

{$ENDREGION}

end.
