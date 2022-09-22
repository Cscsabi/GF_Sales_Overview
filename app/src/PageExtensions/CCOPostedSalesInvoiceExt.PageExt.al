pageextension 50013 "CCO Posted Sales Invoice Ext." extends "Posted Sales Invoice"
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
