codeunit 50001 "CCO Sales Overview Handler"
{
    [EventSubscriber(ObjectType::Table, Database::"Sales Header", 'OnInitInsertOnBeforeInitRecord', '', true, true)]
    local procedure OnInitInsertOnBeforeInitRecord(var SalesHeader: Record "Sales Header")
    var
        SalesOverviewMgt: Codeunit "CCO Sales Overview Mgt.";
    begin
        SalesOverviewMgt.SetOriginalOrderNo(SalesHeader);
    end;

    [EventSubscriber(ObjectType::Page, Page::"Sales Quote Subform", 'OnBeforeUpdateTypeText', '', true, true)]
    local procedure OnBeforeUpdateTypeTextOnSalesQuote(var SalesLine: Record "Sales Line")
    var
        SalesOverviewMgt: Codeunit "CCO Sales Overview Mgt.";
    begin
        SalesOverviewMgt.SetOriginalOrderNos(SalesLine);
    end;

    [EventSubscriber(ObjectType::Page, Page::"Sales Order Subform", 'OnBeforeCalculateTotals', '', true, true)]
    local procedure OnBeforeCalculateTotalsOnSalesOrder(var SalesLine: Record "Sales Line")
    var
        SalesOverviewMgt: Codeunit "CCO Sales Overview Mgt.";
    begin
        SalesOverviewMgt.SetOriginalOrderNos(SalesLine);
    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Line", 'OnInsertOnAfterCheckInventoryConflict', '', true, true)]
    local procedure OnInsertOnAfterCheckInventoryConflictOnSalesInvoice(var SalesLine: Record "Sales Line")
    var
        SalesOverviewMgt: Codeunit "CCO Sales Overview Mgt.";
    begin
        SalesOverviewMgt.SetOriginalOrderNos(SalesLine);
    end;
}
