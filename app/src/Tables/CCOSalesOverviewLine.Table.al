table 50001 "CCO Sales Overview Line"
{
    Caption = 'CCO Sales Overview Line';
    DataClassification = CustomerContent;
    TableType = Temporary;

    fields
    {
        field(1; Description; Text[100])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(2; "Date"; Date)
        {
            Caption = 'Date';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(3; "Document Status"; Option)
        {
            Caption = 'Document Status';
            DataClassification = CustomerContent;
            OptionMembers = Released,Open;
            Editable = false;
        }
        field(4; "Order Type"; Code[20])
        {
            Caption = 'Order Type';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(5; "Line Type"; Code[20])
        {
            Caption = 'Line Type';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(6; Name; Text[100])
        {
            Caption = 'Name';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(7; Quantity; Decimal)
        {
            Caption = 'Quantity';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(8; "Unit of Measure Code"; Code[20])
        {
            Caption = 'Unit of Measure Code';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(9; "Unit Price"; Decimal)
        {
            Caption = 'Unit Price';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(10; "Line Amount"; Decimal)
        {
            Caption = 'Line Amount';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(11; "Discount %"; Decimal)
        {
            Caption = 'Discount %';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(12; "Discount Amount"; Decimal)
        {
            Caption = 'Discount Amount';
            DataClassification = CustomerContent;
            Editable = false;
        }
    }
    keys
    {
        key(PK; Name)
        {
            Clustered = true;
        }
        key(PK2; Description)
        {

        }
        key(PK3; Date)
        {

        }
        key(PK4; "Order Type")
        {

        }
    }
}
