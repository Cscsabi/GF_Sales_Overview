page 50002 "CCO Sales Overview"
{
    Caption = 'Sales Overview';
    PageType = Document;
    SourceTable = "CCO Sales Overview Header";
    UsageCategory = Lists;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Document No. Filter"; Rec."Document No. Filter")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Document No. Filter field.';
                }
                field("External Order No. Filter"; Rec."External Order No. Filter")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the External Order No. Filter field.';
                }
                field("Order No. Filter"; Rec."Order No. Filter")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Order No. Filter field.';
                }
                field("Package Tracking No. Filter"; Rec."Package Tracking No. Filter")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Package Tracking No. Filter field.';
                }
                field("Serial No. Filter"; Rec."Serial No. Filter")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Serial No. Filter field.';
                }
                field("Customer No. Filter"; Rec."Customer No. Filter")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Customer No. Filter field.';
                }
                field("Name Filter"; Rec."Name Filter")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Name Filter field.';
                }
                field("Phone No. Filter"; Rec."Phone No. Filter")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Phone No. Filter field.';
                }
                field("E-mail Filter"; Rec."E-mail Filter")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the E-mail Filter field.';
                }
            }

            part(SalesOverviewLines; "CCO Sales Overview Subform")
            {
                ApplicationArea = Basic, Suite;
                Editable = false;
                UpdatePropagation = Both;
            }
        }

        area(FactBoxes)
        {
            part(Customer; "Customer Details FactBox")
            {
                ApplicationArea = Basic, Suite;
            }
        }
    }
}