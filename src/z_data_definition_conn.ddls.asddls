@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Data definition for a connection table'
@Metadata.ignorePropagatedAnnotations: true
@UI.headerInfo: {
    typeName: 'Connection',
typeNamePlural: 'Connections'
}
@Search.searchable: true
define view entity Z_DATA_DEFINITION_CONN
  as select from /dmo/connection as connection
  association [1..*] to Z_DATA_DEFINITION_FLIGHT as _flight on  $projection.CarrierId    = _flight.CarrierId
                                                            and $projection.ConnectionId = _flight.ConnectionId
  association[1] to Z_DATA_DEFINITION_CARRIER as _airline on $projection.CarrierId = _airline.CarrierId                                                          
{
      @UI.facet: [{ purpose: #STANDARD,
                    label: 'Connection',
                    position: 10,
                    type: #IDENTIFICATION_REFERENCE },
                     { id: 'Flight',
                       purpose: #STANDARD,
                       label: 'Flight',
                       position: 20,
                       type: #LINEITEM_REFERENCE,
                       targetElement: '_flight' }]
      
      @UI.lineItem: [{ position: 10 }]
      @UI.identification: [{ position: 10 }]
      @ObjectModel.text.association: '_airline'
      @Search.defaultSearchElement: true
  key carrier_id      as CarrierId,
      @UI.lineItem: [{ position: 20 }]
      @UI.identification: [{ position: 20 }]
      @Search.defaultSearchElement: true
  key connection_id   as ConnectionId,
      @UI.lineItem: [{ position: 30 }]
      @UI.selectionField: [{position: 10 }]
      @UI.identification: [{ position: 30 }]
      airport_from_id as AirportFromId,
      @UI.lineItem: [{ position: 40 }]
      @UI.selectionField: [{position: 20 }]
      @UI.identification: [{ position: 40 }]
      airport_to_id   as AirportToId,
      @UI.lineItem: [{ position: 50, label: 'Departure Time'}]
      @UI.identification: [{ position: 50 }]
      departure_time  as DepartureTime,
      @UI.lineItem: [{ position: 60, label: 'Arrival Time'}]
      @UI.identification: [{ position: 60 }]
      arrival_time    as ArrivalTime,
      @Semantics.quantity.unitOfMeasure: 'DistanceUnit'
      @UI.lineItem: [{ position: 70 }]
      @UI.identification: [{ position: 70 }]
      distance        as Distance,
      @UI.lineItem: [{ position: 80 }]
      @UI.identification: [{ position: 80 }]
      distance_unit   as DistanceUnit,
      _flight,
      _airline
}
