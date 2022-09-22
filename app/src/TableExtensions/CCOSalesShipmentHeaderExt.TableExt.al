tableextension 50004 "CCO Sales Shipment Header Ext." extends "Sales Shipment Header"
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
