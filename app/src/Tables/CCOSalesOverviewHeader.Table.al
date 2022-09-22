table 50000 "CCO Sales Overview Header"
{
    Caption = 'CCO Sales Overview Header';
    DataClassification = ToBeClassified;
    TableType = Temporary;

    fields
    {
        field(1; "Document No. Filter"; Text[2048])
        {
            Caption = 'Document No. Filter';
            DataClassification = CustomerContent;
            Editable = true;
        }
        field(2; "External Order No. Filter"; Text[2048])
        {
            Caption = 'External Order No. Filter';
            DataClassification = CustomerContent;
            Editable = true;
        }
        field(3; "Order No. Filter"; Text[2048])
        {
            Caption = 'Order No. Filter';
            DataClassification = CustomerContent;
            Editable = true;
        }
        field(4; "Package Tracking No. Filter"; Text[2048])
        {
            Caption = 'Package Tracking No. Filter';
            DataClassification = CustomerContent;
            Editable = true;
        }
        field(5; "Serial No. Filter"; Text[2048])
        {
            Caption = 'Serial No. Filter';
            DataClassification = CustomerContent;
            Editable = true;
        }
        field(6; "Customer No. Filter"; Text[2048])
        {
            Caption = 'Customer No. Filter';
            DataClassification = CustomerContent;
            Editable = true;
        }
        field(7; "Name Filter"; Text[2048])
        {
            Caption = 'Name Filter';
            DataClassification = CustomerContent;
            Editable = true;
        }
        field(8; "Phone No. Filter"; Text[2048])
        {
            Caption = 'Phone No. Filter';
            DataClassification = CustomerContent;
            Editable = true;
        }
        field(9; "E-mail Filter"; Text[2048])
        {
            Caption = 'E-mail Filter';
            DataClassification = CustomerContent;
            Editable = true;
        }
    }
    keys
    {
        key(PK; "Document No. Filter")
        {
            Clustered = true;
        }
    }
}
