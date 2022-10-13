page 50001 "CCO Sales Overview Setup"
{
    ApplicationArea = All;
    Caption = 'Sales Overview Setup';
    PageType = Card;
    SourceTable = "CCO Sales Overview Setup";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Sales Header"; Rec."Sales Header")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Sales Header field.';
                }
                field("Sales Line"; Rec."Sales Line")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Sales Line field.';
                }
                field("Sales Header Archive"; Rec."Sales Header Archive")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Sales Header Archive field.';
                }
                field("Sales Line Archive"; Rec."Sales Line Archive")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Sales Line Archive field.';
                }
                field("Sales Invoice Header"; Rec."Sales Invoice Header")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Sales Invoice Header field.';
                }
                field("Sales Invoice Line"; Rec."Sales Invoice Line")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Sales Invoice Line field.';
                }
                field("Sales Cr. Memo Header"; Rec."Sales Cr. Memo Header")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Sales Cr. Memo Header field.';
                }
                field("Sales Cr. Memo Line"; Rec."Sales Cr. Memo Line")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Sales Cr. Memo Line field.';
                }
                field("Sales Shipment Header"; Rec."Sales Shipment Header")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Sales Shipment Header field.';
                }
                field("Sales Shipment Line"; Rec."Sales Shipment Line")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Sales Shipment Line field.';
                }
            }
        }
    }
}
