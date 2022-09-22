tableextension 50011 "CCO Sales Cr. Memo Line Ext." extends "Sales Cr.Memo Line"
{
    fields
    {
        field(50000; "Original Order No."; Code[20])
        {
            Caption = 'Original Order No.';
            DataClassification = CustomerContent;
        }
        field(50001; "Orig. Order Line No."; Integer)
        {
            Caption = 'Orig. Order Line No.';
            DataClassification = CustomerContent;
        }
    }
}
