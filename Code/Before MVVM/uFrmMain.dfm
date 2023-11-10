object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 269
  ClientWidth = 551
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 56
    Top = 24
    Width = 69
    Height = 13
    Caption = 'Create invoice'
  end
  object EdInvoiceNumber: TEdit
    Left = 56
    Top = 58
    Width = 168
    Height = 21
    TabOrder = 0
  end
  object btnCreate: TButton
    Left = 56
    Top = 112
    Width = 75
    Height = 25
    Caption = 'Create'
    TabOrder = 1
    OnClick = btnCreateClick
  end
end
