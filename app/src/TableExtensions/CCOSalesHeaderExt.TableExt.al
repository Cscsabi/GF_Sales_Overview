tableextension 50000 "CCO Sales Header Ext." extends "Sales Header"
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
