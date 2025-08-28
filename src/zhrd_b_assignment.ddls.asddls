@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Assignment base view'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZHRD_B_ASSIGNMENT
  as select from ZHRD_assignment
{
  key employee_id as EmployeeId,
  key date_from   as DateFrom,
  key date_to     as DateTo,
      customer    as Customer
}
