codeunit 50001 "CCO Sales Overview Handler"
{
    [EventSubscriber(ObjectType::Table, Database::"Sales Header", 'OnAfterSelltoCustomerNoOnAfterValidate', '', true, true)]
    local procedure OnAfterSelltoCustomerNoOnAfterValidate(var SalesHeader: Record "Sales Header")
    var
        SalesOverviewMgt: Codeunit "CCO Sales Overview Mgt.";
    begin
        SalesOverviewMgt.SetOriginalOrderNoOnSalesQuote(SalesHeader);
    end;

    [EventSubscriber(ObjectType::Page, Page::"Sales Quote Subform", 'OnAfterNoOnAfterValidate', '', true, true)]
    local procedure OnAfterNoOnAfterValidate(var SalesLine: Record "Sales Line")
    var
        SalesOverviewMgt: Codeunit "CCO Sales Overview Mgt.";
    begin
        SalesOverviewMgt.SetOriginalOrderNosOnSalesQuoteLines(SalesLine);
    end;

    // TODO: Check Line No. OnValidate()
    //       Orig. Order Line No. 
}
