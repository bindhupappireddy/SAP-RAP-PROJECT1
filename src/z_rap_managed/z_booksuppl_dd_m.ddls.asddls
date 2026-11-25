@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking Supplement data definition managed rap'
@Metadata.ignorePropagatedAnnotations: true
define view entity Z_BOOKSUPPL_DD_M
  as select from zbook_supp_m
  association        to parent Z_BOOKING_DD_M as _booksupp on  $projection.TravelId  = _booksupp.TravelId
                                                           and $projection.BookingId = _booksupp.BookingId
  association [1..1] to Z_TRAVEL_DD_M         as _travel   on  $projection.TravelId = _travel.TravelId
  association [1..1] to /DMO/I_Supplement     as _supp     on  $projection.SupplementId = _supp.SupplementID
  association [1..*] to /DMO/I_SupplementText as _supptext on  $projection.SupplementId = _supptext.SupplementID
{
  key travel_id             as TravelId,
  key booking_id            as BookingId,
  key booking_supplement_id as BookingSupplementId,
      supplement_id         as SupplementId,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      price                 as Price,
      currency_code         as CurrencyCode,
      //last_changed_at plays a special role as field ETag
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at       as LastChangedAt,
      _booksupp,
      _travel,
      _supp,
      _supptext
}
