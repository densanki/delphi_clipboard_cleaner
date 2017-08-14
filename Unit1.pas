unit Unit1;

{$MODE Delphi}

interface

uses
  LCLIntf, LCLType, LMessages, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Clipbrd, StdCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    Timer1: TTimer;
    Panel1: TPanel;
    Memo1: TMemo;
    Button1: TButton;
    procedure Panel1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
    CF_RTF: Word;
  end;

var
  Form1: TForm1;
  Status: Boolean;


implementation

{$R *.lfm}

procedure TForm1.Panel1Click(Sender: TObject);
begin

  IF Panel1.Color = clgreen THEN
  begin
    Panel1.Color := clred;
    Timer1.Enabled := False;
    Panel1.Caption := 'Start';
  end
  ELSE
  begin
    Panel1.Color := clgreen;
    Timer1.Enabled := True;
    Panel1.Caption := 'Stop';
  end;

end;

procedure TForm1.Timer1Timer(Sender: TObject);
var Text:AnsiString;
begin

  try
    IF Form1.Height <> 92 THEN Form1.Height := 92;

    IF Clipboard.HasFormat(CF_TEXT) THEN
    begin
      Text := Clipboard.AsText;
      IF length(Text) <> 0 THEN
      begin
        IF ( (Text[length(Text)]=#10) AND (Text[length(Text)-1]=#13) ) THEN
          Text := COPY(Text,0,length(Text)-2);
      end;
      Clipboard.AsText := Text;
    end;

  except
    on E: Exception do
    begin
      Timer1.Enabled := False;
      Panel1.Color := clred;
      Panel1.Caption := 'Start';

      Form1.Height := 200;

      Memo1.Text := 'Fehler bei der Verarbeitung: ' + E.Message;
    end;

  end;

end;

procedure TForm1.FormCreate(Sender: TObject);
begin

  try

    Form1.Height := 70;

    ShowWindow( Application.MainFormHandle, SW_HIDE );
    SetWindowLong( Application.MainFormHandle, GWL_EXSTYLE,
                   GetWindowLong(Application.MainFormHandle, GWL_EXSTYLE) or
                   WS_EX_TOOLWINDOW and not WS_EX_APPWINDOW);
    ShowWindow( Application.MainFormHandle, SW_SHOW );

  except

    Application.Terminate;
    
  end;

end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  Clipboard.Clear;
end;


end.


