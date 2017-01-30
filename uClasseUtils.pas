unit uClasseUtils;

interface

  uses
    Vcl.Forms, Winapi.Windows;

  procedure MessageInformation(MessageInformation : string);
  procedure MessageQuestion(MessageQuestion : string);
  procedure MessageError(MessageError : string);

implementation

procedure MessageError(MessageError: string);
begin
  Application.MessageBox(pChar('Operation error!' + sLineBreak + 'Reason:' + sLineBreak + MessageError), 'Error', MB_ICONERROR);
end;

procedure MessageInformation(MessageInformation: string);
begin
  Application.MessageBox(pChar(MessageInformation), 'Information', MB_ICONINFORMATION);
end;

procedure MessageQuestion(MessageQuestion: string);
begin
  Application.MessageBox(pChar(MessageQuestion), 'Confirmation', MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2);
end;

end.

