@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Book supp DD Projection managed rap'
@Metadata.allowExtensions: true
define view entity ZC_BOOKSUPPL_PRO_M as projection on Z_BOOKSUPPL_DD_M
{
    key TravelId,
    key BookingId,
    key BookingSupplementId,
    @ObjectModel.text.element: [ 'suppdes' ]
    SupplementId,
    _supptext.Description as suppdes: localized,
    Price,
    CurrencyCode,
    LastChangedAt,
    /* Associations */
    _booksupp: redirected to parent ZC_BOOKING_PRO_M,
    _supp,
    _supptext,
    _travel: redirected to ZC_TRAVEL_PRO_M
}
