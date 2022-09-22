tableextension 50005 "CCO Sales Shipment Line Ext." extends "Sales Shipment Line"
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
