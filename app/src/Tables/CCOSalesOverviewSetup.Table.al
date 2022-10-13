table 50000 "CCO Sales Overview Setup"
{
    DataClassification = CustomerContent;
    Caption = 'Sales Overview Setup';

    fields
    {
        field(1; "Sales Header"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(2; "Sales Line"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(3; "Sales Header Archive"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(4; "Sales Line Archive"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(5; "Sales Invoice Header"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(6; "Sales Invoice Line"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(7; "Sales Cr. Memo Header"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(8; "Sales Cr. Memo Line"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(9; "Sales Shipment Header"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(10; "Sales Shipment Line"; Boolean)
        {
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(Key1; "Sales Header")
        {
            Clustered = true;
        }
    }
}