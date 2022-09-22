codeunit 50000 "CCO Sales Overview Mgt."
{
    procedure SetOriginalOrderNo(var SalesHeader: Record "Sales Header")
    begin
        SalesHeader."Original Order No." := SalesHeader."No.";
    end;

    procedure SetOriginalOrderNos(var SalesLine: Record "Sales Line")
    begin
        SalesLine."Original Order No." := SalesLine."Document No.";
        SalesLine."Orig. Order Line No." := SalesLine."Line No.";
    end;
}
