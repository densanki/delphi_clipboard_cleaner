unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Clipbrd, StdCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    Timer1: TTimer;
    Panel1: TPanel;
    Memo1: TMemo;
    Button1: TButton;
    Button2: TButton;
    ListBox1: TListBox;
    procedure Panel1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
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

{$R *.dfm}

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

    Form1.Height := 92;

    ShowWindow( Application.Handle, SW_HIDE );
    SetWindowLong( Application.Handle, GWL_EXSTYLE,
                   GetWindowLong(Application.Handle, GWL_EXSTYLE) or
                   WS_EX_TOOLWINDOW and not WS_EX_APPWINDOW);
    ShowWindow( Application.Handle, SW_SHOW );

  except

    Application.Terminate;
    
  end;

end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  Clipboard.Clear;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  Data1: THandle;
  Data2: THandle;
  Data3: THandle;
  Data4: THandle;
begin

  Data1 := Clipboard.GetAsHandle(7);

  Clipboard.Clear;

  Clipboard.SetAsHandle(7,Data1);

{  Clipboard.Clear;

  Clipboard.Open;

  Clipboard.SetAsHandle(1,Data1);

  Clipboard.Clear;

  {FOR I := 0 TO Clipboard.FormatCount-1 DO
  begin

    IF NOT(Clipboard.Formats[I] = 1) AND NOT(Clipboard.Formats[I] = 13) THEN
    begin
      Clipboard.SetAsHandle(Clipboard.Formats[I],Data);
      Listbox1.Items.Add(INTtoSTR(Clipboard.Formats[I]));
    end;

  end;}


end;

end.


