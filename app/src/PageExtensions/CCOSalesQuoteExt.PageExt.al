pageextension 50000 "CCO Sales Quote Ext." extends "Sales Quote"
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
