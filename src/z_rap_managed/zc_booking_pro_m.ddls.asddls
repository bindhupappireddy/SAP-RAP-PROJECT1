@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking Supp data def managed rap'
@Metadata.allowExtensions: true
define view entity ZC_BOOKING_PRO_M as projection on Z_BOOKING_DD_M
{ 
    key TravelId,
    key BookingId,
    BookingDate,
    @ObjectModel.text.element: [ 'customername' ]
    CustomerId,
    _customer.LastName as customername,
    @ObjectModel.text.element: [ 'carriername' ]
    CarrierId,
    _carrier.Name as carriername,
    ConnectionId,
    FlightDate,
    FlightPrice,
    CurrencyCode,
    @ObjectModel.text.element: [ 'bookingstatustext' ]
    BookingStatus,
    _status._Text.Text as bookingstatustext: localized,
    LastChangedAt,
    /* Associations */
    _booksupp: redirected to composition child ZC_BOOKSUPPL_PRO_M,
    _carrier,
    _connection,
    _customer,
    _status,
    _Travel: redirected to parent ZC_TRAVEL_PRO_M
}
