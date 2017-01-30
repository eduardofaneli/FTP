unit uFrmFTP;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, IdContext, IdBaseComponent, IdComponent,
  IdCustomTCPServer, IdTCPServer, IdCmdTCPServer, IdExplicitTLSClientServerBase,
  IdFTPServer, Vcl.ExtCtrls, Vcl.StdCtrls, IdTCPConnection, IdTCPClient, IdFTP,
  Vcl.Buttons, Vcl.ComCtrls, uClasseFTP, uClasseUtils;

type

  TfrmFTP = class(TForm)
    pnlButtons: TPanel;
    pnlStatusBar: TPanel;
    pnlMain: TPanel;
    edtHost: TEdit;
    edtPort: TEdit;
    edtUsername: TEdit;
    edtPassword: TEdit;
    ckbProxy: TCheckBox;
    lblHost: TLabel;
    lblPort: TLabel;
    lblUsername: TLabel;
    lblPassword: TLabel;
    btnExit: TSpeedButton;
    btnFtpDisconnect: TSpeedButton;
    btnFtpConnect: TSpeedButton;
    btnFtpTest: TSpeedButton;
    pbStatus: TProgressBar;
    StbConect: TStatusBar;
    pnlView: TPanel;
    pnlButtonsFTP: TPanel;
    btnSendFile: TSpeedButton;
    btnGetFile: TSpeedButton;
    mmLog: TMemo;
    ckbPassive: TCheckBox;
    pnlPaths: TPanel;
    lblFilePath: TLabel;
    btnFindFile: TSpeedButton;
    lblFTPPath: TLabel;
    edtFilePath: TEdit;
    edtFTPPath: TEdit;
    pnlProxy: TPanel;
    lblProxyHost: TLabel;
    lblProxyPort: TLabel;
    lblProxyUsername: TLabel;
    lblProxyPassword: TLabel;
    edtHostProxy: TEdit;
    edtPortProxy: TEdit;
    edtUsernameProxy: TEdit;
    edtPasswordProxy: TEdit;
    btnClearLog: TSpeedButton;
    lblSizeTransfered: TLabel;
    procedure ckbProxyClick(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure btnFindFileClick(Sender: TObject);
    procedure btnFtpTestClick(Sender: TObject);
    procedure btnFtpConnectClick(Sender: TObject);
    procedure edtHostExit(Sender: TObject);
    procedure edtHostEnter(Sender: TObject);
    procedure edtPortEnter(Sender: TObject);
    procedure edtUsernameEnter(Sender: TObject);
    procedure edtPasswordEnter(Sender: TObject);
    procedure rgOperationModeEnter(Sender: TObject);
    procedure edtFilePathEnter(Sender: TObject);
    procedure edtFTPPathEnter(Sender: TObject);
    procedure ckbProxyEnter(Sender: TObject);
    procedure edtHostProxyEnter(Sender: TObject);
    procedure edtPortProxyEnter(Sender: TObject);
    procedure edtUsernameProxyEnter(Sender: TObject);
    procedure edtPasswordProxyEnter(Sender: TObject);
    procedure btnFtpDisconnectClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSendFileClick(Sender: TObject);
    procedure btnClearLogClick(Sender: TObject);
    procedure btnGetFileClick(Sender: TObject);
  private
    fFTP: TFtp;
    sFileName, sMessageException, sMessageValidate: String;
    procedure CreateFTP;
    procedure EnableControls;
    function ValidateControls(out MessageValidate: String): boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFTP: TfrmFTP;

implementation

{$R *.dfm}
{ TfrmFTP }

procedure TfrmFTP.btnFtpConnectClick(Sender: TObject);
begin
  mmLog.Clear;
  mmLog.Font.Color := clBlack;
  if not Assigned(fFTP) then
    CreateFTP;

  if fFTP.Connect(edtFTPPath.Text, sMessageException) then
    mmLog.Lines.Add('Connection successfull!')
  else
  begin
    mmLog.Font.Color := clRed;
    mmLog.Lines.Add('Failed to connect FTP.');
    mmLog.Lines.Add('Reason:');
    mmLog.Lines.Add(sMessageException);

    if Assigned(fFTP) then
      FreeAndNil(fFTP);

  end;
  EnableControls;
end;

procedure TfrmFTP.btnFtpDisconnectClick(Sender: TObject);
begin
  try
    if not fFTP.Disconnect(sMessageException) then
    begin
      mmLog.Font.Color := clBlack;
      mmLog.Lines.Add('FTP disconnected!');
    end
    else
    begin
      mmLog.Font.Color := clRed;
      mmLog.Lines.Add(sMessageException);
    end;
  finally
    if Assigned(fFTP) then
      FreeAndNil(fFTP);
    EnableControls;
  end;
end;

procedure TfrmFTP.btnClearLogClick(Sender: TObject);
begin
  mmLog.Clear;
end;

procedure TfrmFTP.btnExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmFTP.btnFindFileClick(Sender: TObject);
var
  OpenFile: TOpenDialog;
begin
  try
    OpenFile := TOpenDialog.Create(nil);

    if OpenFile.Execute then
    begin
      sFileName := ExtractFileName(OpenFile.FileName);
      edtFilePath.Text := OpenFile.FileName;
    end;

  finally

    FreeAndNil(OpenFile);

  end;
end;

procedure TfrmFTP.btnFtpTestClick(Sender: TObject);
begin
  if ValidateControls(sMessageValidate) then
  begin
    MessageInformation(sMessageValidate);
    Exit;
  end
  else
  begin
    try
      mmLog.Clear;
      mmLog.Font.Color := clBlack;
      if not Assigned(fFTP) then
        CreateFTP;
      if fFTP.TestConnection(edtFTPPath.Text, sMessageException) then
        mmLog.Lines.Add('Test connection successfull!')
      else
      begin
        mmLog.Font.Color := clRed;
        mmLog.Lines.Add('Failed to test connection.');
        mmLog.Lines.Add('Reason:');
        mmLog.Lines.Add(sMessageException);
      end;

    finally
      if Assigned(fFTP) then
        FreeAndNil(fFTP);
      EnableControls;
    end;
  end;

end;

procedure TfrmFTP.btnGetFileClick(Sender: TObject);
begin
//  mmLog.Clear;
//  mmLog.Lines.Add('Preparing file for transfer...');
//  mmLog.Lines.Add('Receiving file...');
//  if fFTP.ReceiveFile(Trim(edtFTPPath.Text), Trim(edtFilePath.Text), sFileName, sMessageException) then
//    mmLog.Lines.Add('File download successfully!')
//  else
//  begin
//    mmLog.Lines.Add('Failed to receive file.');
//    mmLog.Lines.Add('Reason:');
//    mmLog.Lines.Add(sMessageException);
//  end;
end;

procedure TfrmFTP.btnSendFileClick(Sender: TObject);
begin
  mmLog.Font.Color := clBlack;
  mmLog.Lines.Add('Preparing file for transfer...');
  if not fFTP.SendFile(Trim(edtFTPPath.Text), Trim(edtFilePath.Text), sFileName, sMessageException) then
  begin
    mmLog.Font.Color := clRed;
    mmLog.Lines.Add('Failed to send file.');
    mmLog.Lines.Add('Reason:');
    mmLog.Lines.Add(sMessageException);
  end;

end;

procedure TfrmFTP.ckbProxyClick(Sender: TObject);
begin
  pnlProxy.Enabled := ckbProxy.Checked;
end;

procedure TfrmFTP.CreateFTP;
begin
  fFTP := TFtp.Create();

  fFTP.Config(edtHost.Text, edtUsername.Text, edtPassword.Text,
    StrToInt(edtPort.Text), ckbPassive.Checked, ckbProxy.Checked);

  fFTP.TransferProgressBar := pbStatus;
  fFTP.TransferLabel := lblSizeTransfered;
  fftp.MemoLog := mmLog;
end;

procedure TfrmFTP.EnableControls;
begin
  btnFtpTest.Enabled := (not Assigned(fFTP));
  btnFtpConnect.Enabled := (not Assigned(fFTP));
  btnFtpDisconnect.Enabled := (Assigned(fFTP));
  btnExit.Enabled := (not Assigned(fFTP));
  btnSendFile.Enabled := (Assigned(fFTP));
  btnGetFile.Enabled := (Assigned(fFTP));
  pnlMain.Enabled := (not Assigned(fFTP));
  pnlProxy.Enabled := (not Assigned(fFTP)) and (ckbProxy.Checked);
end;

procedure TfrmFTP.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Assigned(fFTP) then
    Abort;
end;

procedure TfrmFTP.FormShow(Sender: TObject);
begin
  EnableControls;
end;

function TfrmFTP.ValidateControls(out MessageValidate: String): boolean;
var
  AEdit: TEdit;
  ALabel: TLabel;
  I: Integer;
begin

  Result := False;
  for I := 0 to pnlMain.ControlCount - 1 do
  begin
    if pnlMain.Controls[I] is TLabel then
    begin
      ALabel := pnlMain.Controls[I] as TLabel;
      if Assigned(ALabel.FocusControl) then
        if ALabel.FocusControl is TEdit then
        begin
          AEdit := ALabel.FocusControl as TEdit;
          if (Trim(AEdit.Text) = EmptyStr) and (AEdit.Tag = 1) then
          begin
            if not Result then
            begin
              Result := True;
              MessageValidate :=
                ('The ' + ALabel.Caption + ' field must be filled in.');
              AEdit.SetFocus;
            end;
            AEdit.Color := clInfoBk;
          end
          else
            AEdit.Color := clWindow;
        end;
    end;
  end;
  if ckbProxy.Checked then
  begin
    for I := 0 to pnlProxy.ControlCount - 1 do
    begin
      if pnlProxy.Controls[I] is TLabel then
      begin
        ALabel := pnlProxy.Controls[I] as TLabel;
        if Assigned(ALabel.FocusControl) then
          if ALabel.FocusControl is TEdit then
          begin
            AEdit := ALabel.FocusControl as TEdit;
            if (Trim(AEdit.Text) = EmptyStr) and (AEdit.Tag = 1) then
            begin
              if not Result then
              begin
                Result := True;
                MessageValidate :=
                  ('The ' + ALabel.Caption + ' field must be filled in.');
                AEdit.SetFocus;
              end;
              AEdit.Color := clInfoBk;
            end
            else
              AEdit.Color := clWindow;
          end;

      end;
    end;
  end;

end;

{$REGION 'StatusBar Panel Hint'}

procedure TfrmFTP.edtHostExit(Sender: TObject);
begin
  StbConect.Panels[0].Text := EmptyStr;
end;

procedure TfrmFTP.ckbProxyEnter(Sender: TObject);
begin
  StbConect.Panels[0].Text := 'Check to use proxy.';
end;

procedure TfrmFTP.edtHostEnter(Sender: TObject);
begin
  StbConect.Panels[0].Text := 'Enter FTP Host.'
end;

procedure TfrmFTP.edtHostProxyEnter(Sender: TObject);
begin
  StbConect.Panels[0].Text := 'Enter Proxy Host.';
end;

procedure TfrmFTP.edtPasswordEnter(Sender: TObject);
begin
  StbConect.Panels[0].Text := 'Enter FTP Password.';
end;

procedure TfrmFTP.edtPasswordProxyEnter(Sender: TObject);
begin
  StbConect.Panels[0].Text := 'Enter Proxy Password.';
end;

procedure TfrmFTP.edtFilePathEnter(Sender: TObject);
begin
  StbConect.Panels[0].Text := 'Enter File Path.';
end;

procedure TfrmFTP.edtFTPPathEnter(Sender: TObject);
begin
  StbConect.Panels[0].Text := 'Enter FTP Path.';
end;

procedure TfrmFTP.edtPortEnter(Sender: TObject);
begin
  StbConect.Panels[0].Text := 'Enter FTP Port.';
end;

procedure TfrmFTP.edtPortProxyEnter(Sender: TObject);
begin
  StbConect.Panels[0].Text := 'Enter Proxy Port.';
end;

procedure TfrmFTP.edtUsernameEnter(Sender: TObject);
begin
  StbConect.Panels[0].Text := 'Enter FTP Username.';
end;

procedure TfrmFTP.edtUsernameProxyEnter(Sender: TObject);
begin
  StbConect.Panels[0].Text := 'Enter Proxy Username.';
end;

procedure TfrmFTP.rgOperationModeEnter(Sender: TObject);
begin
  StbConect.Panels[0].Text := 'Choose the Operation Mode.';
end;

{$ENDREGION}

end.
