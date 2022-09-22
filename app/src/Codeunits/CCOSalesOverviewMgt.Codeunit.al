codeunit 50000 "CCO Sales Overview Mgt."
{
    procedure SetOriginalOrderNoOnSalesQuote(var SalesHeader: Record "Sales Header")
    begin
        SalesHeader."Original Order No." := SalesHeader."No.";
    end;

    procedure SetOriginalOrderNosOnSalesQuoteLines(var SalesLine: Record "Sales Line")
    begin
        SalesLine."Original Order No." := SalesLine."No.";
        SalesLine."Orig. Order Line No." := SalesLine."Line No.";
    end;
}
