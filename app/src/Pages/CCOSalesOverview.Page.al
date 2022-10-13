page 50002 "CCO Sales Overview"
{
    Caption = 'Sales Overview';
    PageType = List;
    SourceTable = "CCO Sales Overview Line";
    UsageCategory = Lists;
    ApplicationArea = All;
    RefreshOnActivate = true;
    SourceTableTemporary = true;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Document No. Filter"; DocNoFilter)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Document No. Filter field.';
                }
                field("External Order No. Filter"; ExtOrderNoFilter)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the External Order No. Filter field.';
                }
                field("Order No. Filter"; OrderNoFilter)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Order No. Filter field.';
                }
                field("Package Tracking No. Filter"; PackageTrackingNoFilter)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Package Tracking No. Filter field.';
                }
                field("Serial No. Filter"; SerialNoFilter)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Serial No. Filter field.';
                }
                field("Customer No. Filter"; CustomerNoFilter)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Customer No. Filter field.';
                }
                field("Name Filter"; NameFilter)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Name Filter field.';
                }
                field("Phone No. Filter"; PhoneNoFilter)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Phone No. Filter field.';
                }
                field("E-mail Filter"; EmailFilter)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the E-mail Filter field.';
                }

            }
            repeater(Lines)
            {
                Editable = false;
                IndentationColumn = DescriptionIndent;
                IndentationControls = Description;
                ShowAsTree = true;
                ShowCaption = false;
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Date"; Rec."Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field("Document Status"; Rec."Document Status")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Document Status field.';
                }
                field("Order Type"; Rec."Order Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Order Type field.';
                }
                field("Line Type"; Rec."Line Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Line Type field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Quantity field.';
                }
                field("Unit of Measure Code"; Rec."Unit of Measure Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Unit of Measure Code field.';
                }
                field("Unit Price"; Rec."Unit Price")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Unit Price field.';
                }
                field("Line Amount"; Rec."Line Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Line Amount field.';
                }
                field("Discount %"; Rec."Discount %")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Discount % field.';
                }
                field("Discount Amount"; Rec."Discount Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Discount Amount field.';
                }
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

    actions
    {
        area(processing)
        {
            action(Search)
            {
                ApplicationArea = All;
                Caption = 'Search';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = Apply;

                trigger OnAction()
                var
                    SalesOverviewSearch: Codeunit "CCO Sales Overview Search";
                begin
                    Rec.DeleteAll();

                    SalesOverviewSetup.Get();

                    SearchFilter();

                    CurrPage.Update(false);
                end;
            }
            action(GetSetupPage)
            {
                ApplicationArea = All;
                Caption = 'Setup Page';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = Find;

                trigger OnAction()
                begin
                    Page.RunModal(Page::"CCO Sales Overview Setup");
                end;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        DescriptionIndent := 0;
    end;

    procedure SearchFilter()
    var
        SalesHeader: Record "Sales Header";
        SalesLine: Record "Sales Line";
        SalesHeaderArchive: Record "Sales Header Archive";
        SalesLineArchive: Record "Sales Line Archive";
        SalesInvoiceHeader: Record "Sales Invoice Header";
        SalesInvoiceLine: Record "Sales Invoice Line";
        SalesCrMemoHeader: Record "Sales Cr.Memo Header";
        SalesCrMemoLine: Record "Sales Cr.Memo Line";
        SalesShipmentHeader: Record "Sales Shipment Header";
        SalesShipmentLine: Record "Sales Shipment Line";
        OrdinalValue: Integer;
        // UNUSED YET
        CustomerLedgerEntry: Record "Cust. Ledger Entry";
        ItemLedgerEntry: Record "Item Ledger Entry";
    begin
        SetFiltersOnSalesHeader(SalesHeader);
        SetFiltersOnSalesLine(SalesLine);
        SetFiltersOnSalesHeaderArchive(SalesHeaderArchive);
        SetFiltersOnSalesLineArchive(SalesLineArchive);
        SetFiltersOnSalesInvoiceHeader(SalesInvoiceHeader);
        SetFiltersOnSalesInvoiceLine(SalesInvoiceLine);
        SetFiltersOnSalesCrMemoHeader(SalesCrMemoHeader);
        SetFiltersOnSalesCrMemoLine(SalesCrMemoLine);
        SetFiltersOnSalesShipmentHeader(SalesShipmentHeader);
        SetFiltersOnSalesShipmentLine(SalesShipmentLine);

        if SalesHeader.FindSet() then
            repeat
                Rec.Init();
                Rec.Description := SalesHeader."Sell-to Customer No." + ' - ' + SalesHeader."Sell-to Customer Name";
                Rec.Date := SalesHeader."Order Date";
                OrdinalValue := SalesHeader."Document Type".AsInteger();
                //Rec."Order Type" := SalesHeader."Document Type".Names.Get(OrdinalValue);
                Rec."Document Status" := SalesHeader.Status;
                if not Rec.Insert() then
                    Rec.Modify();
            until SalesHeader.Next() = 0;

        if SalesLine.FindSet() then
            repeat
                Rec.Init();
                DescriptionIndent := DescriptionIndent + 5;
                Rec.Description := 'Order Line';
                Rec.Date := SalesLine."Shipment Date";
                OrdinalValue := SalesLine."Document Type".AsInteger();
                Rec."Order Type" := SalesLine."Document Type".Names.Get(SalesLine."Document Type".Ordinals.IndexOf(OrdinalValue));
                //OrdinalValue := SalesLine.Type.AsInteger();
                //Rec."Line Type" := SalesLine.Type.Names.Get(OrdinalValue);
                Rec.Name := SalesLine.Description;
                Rec.Quantity := SalesLine.Quantity;
                Rec."Unit of Measure Code" := SalesLine."Unit of Measure";
                Rec."Unit Price" := SalesLine."Unit Price";
                Rec."Line Amount" := SalesLine."Line Amount";
                Rec."Discount %" := SalesLine."Line Discount %";
                Rec."Discount Amount" := SalesLine."Line Discount Amount";
                if not Rec.Insert() then
                    Rec.Modify();
            until SalesLine.Next() = 0;

        if SalesHeaderArchive.FindSet() then
            repeat
                Rec.Init();
                Rec.Description := SalesHeaderArchive."Sell-to Customer No." + ' - ' + SalesHeaderArchive."Sell-to Customer Name";
                Rec.Date := SalesHeaderArchive."Order Date";
                OrdinalValue := SalesHeaderArchive."Document Type".AsInteger();
                //Rec."Order Type" := SalesHeader."Document Type".Names.Get(OrdinalValue);
                Rec."Document Status" := SalesHeaderArchive.Status;
                if not Rec.Insert() then
                    Rec.Modify();
            until SalesHeaderArchive.Next() = 0;

        if SalesLineArchive.FindSet() then
            repeat
                Rec.Init();
                Rec.Description := 'Order Line';
                Rec.Date := SalesLineArchive."Shipment Date";
                OrdinalValue := SalesLineArchive."Document Type".AsInteger();
                Rec."Order Type" := SalesLineArchive."Document Type".Names.Get(SalesLineArchive."Document Type".Ordinals.IndexOf(OrdinalValue));
                //OrdinalValue := SalesLine.Type.AsInteger();
                //Rec."Line Type" := SalesLine.Type.Names.Get(OrdinalValue);
                Rec."Document Status" := Rec."Document Status"::Released;
                Rec.Name := SalesLineArchive.Description;
                Rec.Quantity := SalesLineArchive.Quantity;
                Rec."Unit of Measure Code" := SalesLineArchive."Unit of Measure";
                Rec."Unit Price" := SalesLineArchive."Unit Price";
                Rec."Line Amount" := SalesLineArchive."Line Amount";
                Rec."Discount %" := SalesLineArchive."Line Discount %";
                Rec."Discount Amount" := SalesLineArchive."Line Discount Amount";
                if not Rec.Insert() then
                    Rec.Modify();
            until SalesLineArchive.Next() = 0;

        if SalesInvoiceHeader.FindSet() then
            repeat
                Rec.Init();
                Rec.Description := SalesInvoiceHeader."Sell-to Customer No." + ' - ' + SalesInvoiceHeader."Sell-to Customer Name";
                Rec.Date := SalesInvoiceHeader."Order Date";
                //Rec."Order Type" := SalesHeader."Document Type".Names.Get(OrdinalValue);
                Rec."Document Status" := Rec."Document Status"::Released;
                if not Rec.Insert() then
                    Rec.Modify();
            until SalesInvoiceHeader.Next() = 0;

        if SalesInvoiceLine.FindSet() then
            repeat
                Rec.Init();
                Rec.Description := 'Invoice Line';
                Rec.Date := SalesInvoiceLine."Shipment Date";
                //OrdinalValue := SalesInvoiceLine."Document Type".AsInteger();
                //Rec."Order Type" := SalesInvoiceLine."Document Type".Names.Get(SalesInvoiceLine."Document Type".Ordinals.IndexOf(OrdinalValue));
                //OrdinalValue := SalesLine.Type.AsInteger();
                //Rec."Line Type" := SalesLine.Type.Names.Get(OrdinalValue);
                Rec."Document Status" := Rec."Document Status"::Released;
                Rec.Name := SalesInvoiceLine.Description;
                Rec.Quantity := SalesInvoiceLine.Quantity;
                Rec."Unit of Measure Code" := SalesInvoiceLine."Unit of Measure";
                Rec."Unit Price" := SalesInvoiceLine."Unit Price";
                Rec."Line Amount" := SalesInvoiceLine."Line Amount";
                Rec."Discount %" := SalesInvoiceLine."Line Discount %";
                Rec."Discount Amount" := SalesInvoiceLine."Line Discount Amount";
                if not Rec.Insert() then
                    Rec.Modify();
            until SalesInvoiceLine.Next() = 0;

        if SalesCrMemoHeader.FindSet() then
            repeat
                Rec.Init();
                Rec.Description := SalesCrMemoHeader."Sell-to Customer No." + ' - ' + SalesCrMemoHeader."Sell-to Customer Name";
                Rec.Date := SalesCrMemoHeader."Document Date";
                //OrdinalValue := SalesCrMemoHeader."Document Type".AsInteger();
                //Rec."Order Type" := SalesHeader."Document Type".Names.Get(OrdinalValue);
                Rec."Document Status" := Rec."Document Status"::Released;
                if not Rec.Insert() then
                    Rec.Modify();
            until SalesCrMemoHeader.Next() = 0;

        if SalesCrMemoLine.FindSet() then
            repeat
                Rec.Init();
                Rec.Description := 'Cr. Memo Line';
                Rec.Date := SalesCrMemoLine."Shipment Date";
                //OrdinalValue := SalesCrMemoLine."Document Type".AsInteger();
                //Rec."Order Type" := SalesCrMemoLine."Document Type".Names.Get(SalesLine."Document Type".Ordinals.IndexOf(OrdinalValue));
                //OrdinalValue := SalesLine.Type.AsInteger();
                //Rec."Line Type" := SalesLine.Type.Names.Get(OrdinalValue);
                Rec."Document Status" := Rec."Document Status"::Released;
                Rec.Name := SalesCrMemoLine.Description;
                Rec.Quantity := SalesCrMemoLine.Quantity;
                Rec."Unit of Measure Code" := SalesCrMemoLine."Unit of Measure";
                Rec."Unit Price" := SalesCrMemoLine."Unit Price";
                Rec."Line Amount" := SalesCrMemoLine."Line Amount";
                Rec."Discount %" := SalesCrMemoLine."Line Discount %";
                Rec."Discount Amount" := SalesCrMemoLine."Line Discount Amount";
                if not Rec.Insert() then
                    Rec.Modify();
            until SalesCrMemoLine.Next() = 0;

        if SalesShipmentHeader.FindSet() then
            repeat
                Rec.Init();
                Rec.Description := SalesShipmentHeader."Sell-to Customer No." + ' - ' + SalesShipmentHeader."Sell-to Customer Name";
                Rec.Date := SalesShipmentHeader."Order Date";
                //OrdinalValue := SalesShipmentHeader."Document Type".AsInteger();
                //Rec."Order Type" := SalesHeader."Document Type".Names.Get(OrdinalValue);
                Rec."Document Status" := Rec."Document Status"::Released;
                if not Rec.Insert() then
                    Rec.Modify();
            until SalesShipmentHeader.Next() = 0;

        if SalesShipmentLine.FindSet() then
            repeat
                Rec.Init();
                Rec.Description := 'Shipment Line';
                Rec.Date := SalesShipmentLine."Shipment Date";
                //OrdinalValue := SalesShipmentLine."Document Type".AsInteger();
                //Rec."Order Type" := SalesShipmentLine."Document Type".Names.Get(SalesShipmentLine."Document Type".Ordinals.IndexOf(OrdinalValue));
                //OrdinalValue := SalesLine.Type.AsInteger();
                //Rec."Line Type" := SalesLine.Type.Names.Get(OrdinalValue);
                Rec."Document Status" := Rec."Document Status"::Released;
                Rec.Name := SalesShipmentLine.Description;
                Rec.Quantity := SalesShipmentLine.Quantity;
                Rec."Unit of Measure Code" := SalesShipmentLine."Unit of Measure";
                Rec."Unit Price" := SalesShipmentLine."Unit Price";
                Rec."Line Amount" := SalesShipmentLine."VAT Base Amount";
                Rec."Discount %" := SalesShipmentLine."Line Discount %";
                if not Rec.Insert() then
                    Rec.Modify();
            until SalesShipmentLine.Next() = 0;
    end;

    procedure SetFiltersOnSalesHeader(var SalesHeader: Record "Sales Header")
    begin
        if SalesOverviewSetup."Sales Header" then begin
            SalesHeader.SetFilter("No.", '@*' + DocNoFilter + '*');
            SalesHeader.SetFilter("External Document No.", '@*' + ExtOrderNoFilter + '*');
            SalesHeader.SetFilter("Original Order No.", '@*' + OrderNoFilter + '*');
            SalesHeader.SetFilter("Package Tracking No.", '@*' + PackageTrackingNoFilter + '*');
            SalesHeader.SetFilter("Sell-to Customer No.", '@*' + CustomerNoFilter + '*');
            SalesHeader.SetFilter("Sell-to Contact", '@*' + NameFilter + '*');
            SalesHeader.SetFilter("Sell-to Phone No.", '@*' + PhoneNoFilter + '*');
            SalesHeader.SetFilter("Sell-to E-Mail", '@*' + EmailFilter + '*');
        end;
    end;

    procedure SetFiltersOnSalesLine(var SalesLine: Record "Sales Line")
    begin
        if SalesOverviewSetup."Sales Line" then begin
            SalesLine.SetFilter("Document No.", '@*' + DocNoFilter + '*');
            SalesLine.SetFilter("Original Order No.", '@*' + OrderNoFilter + '*');
            SalesLine.SetFilter("Sell-to Customer No.", '@*' + CustomerNoFilter + '*');
        end;
    end;

    procedure SetFiltersOnSalesHeaderArchive(var SalesHeaderArchive: Record "Sales Header Archive")
    begin
        if SalesOverviewSetup."Sales Header Archive" then begin
            SalesHeaderArchive.SetFilter("No.", '@*' + DocNoFilter + '*');
            SalesHeaderArchive.SetFilter("External Document No.", '@*' + ExtOrderNoFilter + '*');
            SalesHeaderArchive.SetFilter("Original Order No.", '@*' + OrderNoFilter + '*');
            SalesHeaderArchive.SetFilter("Package Tracking No.", '@*' + PackageTrackingNoFilter + '*');
            SalesHeaderArchive.SetFilter("Sell-to Customer No.", '@*' + CustomerNoFilter + '*');
            SalesHeaderArchive.SetFilter("Sell-to Contact", '@*' + NameFilter + '*');
            SalesHeaderArchive.SetFilter("Sell-to Phone No.", '@*' + PhoneNoFilter + '*');
            SalesHeaderArchive.SetFilter("Sell-to E-Mail", '@*' + EmailFilter + '*');
        end;
    end;

    procedure SetFiltersOnSalesLineArchive(var SalesLineArchive: Record "Sales Line Archive")
    begin
        if SalesOverviewSetup."Sales Line Archive" then begin
            SalesLineArchive.SetFilter("Document No.", '@*' + DocNoFilter + '*');
            SalesLineArchive.SetFilter("Original Order No.", '@*' + OrderNoFilter + '*');
            SalesLineArchive.SetFilter("Sell-to Customer No.", '@*' + CustomerNoFilter + '*');
        end;
    end;

    procedure SetFiltersOnSalesInvoiceHeader(var SalesInvoiceHeader: Record "Sales Invoice Header")
    begin
        if SalesOverviewSetup."Sales Invoice Header" then begin
            SalesInvoiceHeader.SetFilter("No.", '@*' + DocNoFilter + '*');
            SalesInvoiceHeader.SetFilter("External Document No.", '@*' + ExtOrderNoFilter + '*');
            SalesInvoiceHeader.SetFilter("Original Order No.", '@*' + OrderNoFilter + '*');
            SalesInvoiceHeader.SetFilter("Package Tracking No.", '@*' + PackageTrackingNoFilter + '*');
            SalesInvoiceHeader.SetFilter("Sell-to Customer No.", '@*' + CustomerNoFilter + '*');
            SalesInvoiceHeader.SetFilter("Sell-to Contact", '@*' + NameFilter + '*');
            SalesInvoiceHeader.SetFilter("Sell-to Phone No.", '@*' + PhoneNoFilter + '*');
            SalesInvoiceHeader.SetFilter("Sell-to E-Mail", '@*' + EmailFilter + '*');
        end;
    end;

    procedure SetFiltersOnSalesInvoiceLine(var SalesInvoiceLine: Record "Sales Invoice Line")
    begin
        if SalesOverviewSetup."Sales Invoice Line" then begin
            SalesInvoiceLine.SetFilter("Document No.", '@*' + DocNoFilter + '*');
            SalesInvoiceLine.SetFilter("Original Order No.", '@*' + OrderNoFilter + '*');
            SalesInvoiceLine.SetFilter("Sell-to Customer No.", '@*' + CustomerNoFilter + '*');
        end;
    end;

    procedure SetFiltersOnSalesCrMemoHeader(var SalesCrMemoHeader: Record "Sales Cr.Memo Header")
    begin
        if SalesOverviewSetup."Sales Cr. Memo Header" then begin
            SalesCrMemoHeader.SetFilter("No.", '@*' + DocNoFilter + '*');
            SalesCrMemoHeader.SetFilter("External Document No.", '@*' + ExtOrderNoFilter + '*');
            SalesCrMemoHeader.SetFilter("Original Order No.", '@*' + OrderNoFilter + '*');
            SalesCrMemoHeader.SetFilter("Package Tracking No.", '@*' + PackageTrackingNoFilter + '*');
            SalesCrMemoHeader.SetFilter("Sell-to Customer No.", '@*' + CustomerNoFilter + '*');
            SalesCrMemoHeader.SetFilter("Sell-to Contact", '@*' + NameFilter + '*');
            SalesCrMemoHeader.SetFilter("Sell-to Phone No.", '@*' + PhoneNoFilter + '*');
            SalesCrMemoHeader.SetFilter("Sell-to E-Mail", '@*' + EmailFilter + '*');
        end;
    end;

    procedure SetFiltersOnSalesCrMemoLine(var SalesCrMemoLine: Record "Sales Cr.Memo Line")
    begin
        if SalesOverviewSetup."Sales Cr. Memo Line" then begin
            SalesCrMemoLine.SetFilter("Document No.", '@*' + DocNoFilter + '*');
            SalesCrMemoLine.SetFilter("Original Order No.", '@*' + OrderNoFilter + '*');
            SalesCrMemoLine.SetFilter("Sell-to Customer No.", '@*' + CustomerNoFilter + '*');
        end;
    end;

    procedure SetFiltersOnSalesShipmentHeader(var SalesShipmentHeader: Record "Sales Shipment Header")
    begin
        if SalesOverviewSetup."Sales Shipment Header" then begin
            SalesShipmentHeader.SetFilter("No.", '@*' + DocNoFilter + '*');
            SalesShipmentHeader.SetFilter("External Document No.", '@*' + ExtOrderNoFilter + '*');
            SalesShipmentHeader.SetFilter("Original Order No.", '@*' + OrderNoFilter + '*');
            SalesShipmentHeader.SetFilter("Package Tracking No.", '@*' + PackageTrackingNoFilter + '*');
            SalesShipmentHeader.SetFilter("Sell-to Customer No.", '@*' + CustomerNoFilter + '*');
            SalesShipmentHeader.SetFilter("Sell-to Contact", '@*' + NameFilter + '*');
            SalesShipmentHeader.SetFilter("Sell-to Phone No.", '@*' + PhoneNoFilter + '*');
            SalesShipmentHeader.SetFilter("Sell-to E-Mail", '@*' + EmailFilter + '*');
        end;
    end;

    procedure SetFiltersOnSalesShipmentLine(var SalesShipmentLine: Record "Sales Shipment Line")
    begin
        if SalesOverviewSetup."Sales Shipment Line" then begin
            SalesShipmentLine.SetFilter("Document No.", '@*' + DocNoFilter + '*');
            SalesShipmentLine.SetFilter("Original Order No.", '@*' + OrderNoFilter + '*');
            SalesShipmentLine.SetFilter("Sell-to Customer No.", '@*' + CustomerNoFilter + '*');
        end;
    end;

    var
        DocNoFilter: Text[100];
        ExtOrderNoFilter: Text[100];
        OrderNoFilter: Text[100];
        PackageTrackingNoFilter: Text[100];
        SerialNoFilter: Text[100];
        CustomerNoFilter: Text[100];
        NameFilter: Text[100];
        PhoneNoFilter: Text[100];
        EmailFilter: Text[100];
        DescriptionIndent: Integer;
        StatusText: Text[1024];
        SalesOverviewSetup: Record "CCO Sales Overview Setup";
}