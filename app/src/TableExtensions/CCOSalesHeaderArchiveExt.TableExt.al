tableextension 50002 "CCO Sales Header Archive Ext." extends "Sales Header Archive"
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
