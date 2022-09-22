pageextension 50015 "CCO Sales Return Order Ext." extends "Sales Return Order"
{
    layout
    {
        addlast(General)
        {
            field("Original Order No."; Rec."Original Order No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Original Order No.';
            }
        }
    }
}
