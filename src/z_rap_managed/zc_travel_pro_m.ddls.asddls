@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Travel DD Projection managed rap'
@Metadata.allowExtensions: true
define root view entity ZC_TRAVEL_PRO_M
  provider contract transactional_query
  as projection on Z_TRAVEL_DD_M
{
  key TravelId,
      @ObjectModel.text.element: [ 'AgencyName' ]
      AgencyId,
      _agency.Name       as AgencyName,
      @ObjectModel.text.element: [ 'CustomerName' ]
      
      CustomerId,
      _customer.LastName as CustomerName,
      BeginDate,
      EndDate,
      BookingFee,
      TotalPrice,
      CurrencyCode,
      Description,
      @ObjectModel.text.element: [ 'OverallStatusText' ]
      OverallStatus,
      _status._Text.Text as OverallStatusText : localized,
      CreatedBy,
      CreatedAt,
      LastChangedBy,
      LastChangedAt,
      /* Associations */
      _agency,
      _booking : redirected to composition child ZC_BOOKING_PRO_M,
      _currency,
      _customer,
      _status
}
