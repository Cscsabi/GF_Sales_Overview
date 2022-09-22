pageextension 50011 "CCO Sales Invoice Ext." extends "Sales Invoice"
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
