pageextension 50016 "CCO Sales Ret. Order Line Ext" extends "Sales Return Order Subform"
{
    layout
    {
        addlast(Control1)
        {
            field("Original Order No."; Rec."Original Order No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Original Order No.';
            }
            field("Orig. Order Line No."; Rec."Orig. Order Line No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Orig. Order Line No.';
            }
        }
    }
}
