codeunit 50003 "Sales Shipment Mgt"
{
    procedure TrasferOriginalOrderNoOnShipment(SalesHeader: Record "Sales Header"; var SalesShipmentHeader: Record "Sales Shipment Header")
    begin
        SalesShipmentHeader."Original Order No." := SalesHeader."Original Order No.";
    end;

    procedure TrasferOriginalOrderNoOnShipmentLine(SalesLine: Record "Sales Line"; var SalesShipmentLine: Record "Sales Shipment Line")
    begin
        SalesShipmentLine."Original Order No." := SalesLine."Original Order No.";
    end;
}
