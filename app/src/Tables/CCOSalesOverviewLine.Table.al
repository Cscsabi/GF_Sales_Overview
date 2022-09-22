table 50001 "CCO Sales Overview Line"
{
    Caption = 'CCO Sales Overview Line';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; Description; Option)
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
            OptionMembers = Order,"Order Line","Item Ledger Entry";
        }
        field(2; "Date"; Date)
        {
            Caption = 'Date';
            DataClassification = CustomerContent;
        }
        field(3; "Document Status"; Code[20])
        {
            Caption = 'Document Status';
            DataClassification = CustomerContent;
        }
        field(4; "Order Type"; Code[20])
        {
            Caption = 'Order Type';
            DataClassification = CustomerContent;
        }
        field(5; "Line Type"; Code[20])
        {
            Caption = 'Line Type';
            DataClassification = CustomerContent;
        }
        field(6; Name; Text[100])
        {
            Caption = 'Name';
            DataClassification = CustomerContent;
        }
        field(7; Quantity; Decimal)
        {
            Caption = 'Quantity';
            DataClassification = CustomerContent;
        }
        field(8; "Unit of Measure Code"; Code[20])
        {
            Caption = 'Unit of Measure Code';
            DataClassification = CustomerContent;
        }
        field(9; "Unit Price"; Decimal)
        {
            Caption = 'Unit Price';
            DataClassification = CustomerContent;
        }
        field(10; "Line Amount"; Decimal)
        {
            Caption = 'Line Amount';
            DataClassification = CustomerContent;
        }
        field(11; "Discount %"; Decimal)
        {
            Caption = 'Discount %';
            DataClassification = CustomerContent;
        }
        field(12; "Discount Amount"; Decimal)
        {
            Caption = 'Discount Amount';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; Description)
        {
            Clustered = true;
        }
    }
}
