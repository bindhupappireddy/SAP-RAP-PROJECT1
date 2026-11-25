@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking data definition managed rap'
@Metadata.ignorePropagatedAnnotations: true
define view entity Z_BOOKING_DD_M
  as select from zbooking_managed
  association        to parent Z_TRAVEL_DD_M     as _Travel     on  $projection.TravelId = _Travel.TravelId
  composition [0..*] of Z_BOOKSUPPL_DD_M         as _booksupp
  association [1..1] to /DMO/I_Carrier           as _carrier    on  $projection.CarrierId = _carrier.AirlineID
  association [1..1] to /DMO/I_Customer          as _customer   on  $projection.CustomerId = _customer.CustomerID
  association [1..1] to /DMO/I_Connection        as _connection on  $projection.CarrierId    = _connection.AirlineID
                                                                and $projection.ConnectionId = _connection.ConnectionID
  association [0..1] to /DMO/I_Booking_Status_VH as _status     on  $projection.BookingStatus = _status.BookingStatus
{
  key travel_id       as TravelId,
  key booking_id      as BookingId,
      booking_date    as BookingDate,
      customer_id     as CustomerId,
      carrier_id      as CarrierId,
      connection_id   as ConnectionId,
      flight_date     as FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      flight_price    as FlightPrice,
      currency_code   as CurrencyCode,
      booking_status  as BookingStatus,
      //last_changed_at plays a special role as field ETag
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at as LastChangedAt,
      _Travel,
      _booksupp,
      _carrier,
      _customer,
      _connection,
      _status
}
