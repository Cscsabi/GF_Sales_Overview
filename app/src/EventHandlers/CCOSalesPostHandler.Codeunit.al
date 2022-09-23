codeunit 50002 "CCO Sales-Post Handler"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnAfterSalesShptHeaderInsert', '', true, true)]
    local procedure OnAfterSalesShptHeaderInsert(SalesHeader: Record "Sales Header"; var SalesShipmentHeader: Record "Sales Shipment Header")
    begin
        SalesShipmentMgt.TrasferOriginalOrderNoOnShipment(SalesHeader, SalesShipmentHeader);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnAfterSalesShptLineInsert', '', true, true)]
    local procedure OnAfterSalesShptLineInsert(SalesLine: Record "Sales Line"; var SalesShipmentLine: Record "Sales Shipment Line")
    begin

    end;

    var
        SalesShipmentMgt: Codeunit "Sales Shipment Mgt";
}
