object Form1: TForm1
  Left = 208
  Top = 137
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
  BorderStyle = bsDialog
  Caption = 'COPYOK V1.6'
  ClientHeight = 484
  ClientWidth = 611
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 10
    Top = 15
    Width = 131
    Height = 36
    Caption = 'Start'
    Color = clRed
    TabOrder = 0
    OnClick = Panel1Click
  end
  object Memo1: TMemo
    Left = 10
    Top = 70
    Width = 131
    Height = 91
    TabOrder = 1
  end
  object Button1: TButton
    Left = 10
    Top = 55
    Width = 41
    Height = 11
    Caption = 'clear'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 95
    Top = 55
    Width = 46
    Height = 11
    Caption = 'test'
    TabOrder = 3
    OnClick = Button2Click
  end
  object ListBox1: TListBox
    Left = 155
    Top = 15
    Width = 401
    Height = 51
    ItemHeight = 13
    TabOrder = 4
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 500
    OnTimer = Timer1Timer
    Left = 15
    Top = 20
  end
end
