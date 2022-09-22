pageextension 50017 "CCO Sales Credit Memo Ext." extends "Sales Credit Memo"
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
