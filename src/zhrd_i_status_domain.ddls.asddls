@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'To read status domain values'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@ObjectModel.resultSet.sizeCategory: #XS
define view entity ZHRD_I_STATUS_DOMAIN
  as select from DDCDS_CUSTOMER_DOMAIN_VALUE_T(p_domain_name: 'ZHRD_STATUS')
{

  key language  as Language,
  @ObjectModel.text.element: [ 'Description' ]
  key value_low as ValueLow,
      text      as Description
}
