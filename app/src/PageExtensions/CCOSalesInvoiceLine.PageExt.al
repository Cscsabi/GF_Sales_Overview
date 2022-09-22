pageextension 50012 "CCO Sales Invoice Line" extends "Sales Invoice Subform"
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
