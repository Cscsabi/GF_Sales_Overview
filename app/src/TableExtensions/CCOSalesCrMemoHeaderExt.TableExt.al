tableextension 50010 "CCO Sales Cr. Memo Header Ext." extends "Sales Cr.Memo Header"
{
    fields
    {
        field(50000; "Original Order No."; Code[20])
        {
            Caption = 'Original Order No.';
            DataClassification = CustomerContent;
        }
    }
}
