@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Data definition for a Carrier table'
@Metadata.ignorePropagatedAnnotations: true
define view entity Z_DATA_DEFINITION_CARRIER as select from /dmo/carrier
{
    key carrier_id as CarrierId,
    @Semantics.text: true
    @Search.defaultSearchElement: true
    @Search.fuzzinessThreshold: 0.8
    name as Name,
    currency_code as CurrencyCode
}
