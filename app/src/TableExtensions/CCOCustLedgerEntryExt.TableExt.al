tableextension 50009 "CCO Cust. Ledger Entry Ext." extends "Cust. Ledger Entry"
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
