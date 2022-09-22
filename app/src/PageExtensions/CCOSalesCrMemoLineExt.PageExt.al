pageextension 50018 "CCO Sales Cr. Memo Line Ext." extends "Sales Cr. Memo Subform"
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
