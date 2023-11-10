object frmInvoice: TfrmInvoice
  Left = 0
  Top = 0
  Caption = 'frmInvoice'
  ClientHeight = 636
  ClientWidth = 807
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object lblInvoiceNo: TLabel
    Left = 152
    Top = 32
    Width = 48
    Height = 13
    Caption = 'InvoiceNo'
  end
  object Label1: TLabel
    Left = 152
    Top = 72
    Width = 46
    Height = 13
    Caption = 'Customer'
  end
  object Label2: TLabel
    Left = 152
    Top = 101
    Width = 16
    Height = 13
    Caption = 'qty'
  end
  object Label3: TLabel
    Left = 204
    Top = 101
    Width = 52
    Height = 13
    Caption = 'description'
  end
  object Label4: TLabel
    Left = 400
    Top = 101
    Width = 23
    Height = 13
    Caption = 'Price'
  end
  object edCustomer: TEdit
    Left = 204
    Top = 69
    Width = 245
    Height = 21
    TabOrder = 0
    OnChange = edCustomerChange
  end
  object mmoInvoice: TMemo
    Left = 149
    Top = 160
    Width = 300
    Height = 369
    TabOrder = 1
  end
  object edQty: TEdit
    Left = 152
    Top = 120
    Width = 46
    Height = 21
    TabOrder = 2
  end
  object edDescription: TEdit
    Left = 204
    Top = 120
    Width = 190
    Height = 21
    TabOrder = 3
  end
  object edPrice: TEdit
    Left = 400
    Top = 120
    Width = 49
    Height = 21
    TabOrder = 4
  end
  object Button1: TButton
    Left = 472
    Top = 118
    Width = 75
    Height = 25
    Caption = 'Add line'
    TabOrder = 5
    OnClick = Button1Click
  end
  object btnSave: TButton
    Left = 472
    Top = 560
    Width = 75
    Height = 25
    Caption = 'Save'
    TabOrder = 6
    OnClick = btnSaveClick
  end
  object sd: TSaveDialog
    Left = 400
    Top = 320
  end
end
