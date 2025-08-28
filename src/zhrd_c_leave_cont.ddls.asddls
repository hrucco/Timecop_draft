@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Leave contacts projection view'
@Metadata.allowExtensions: true
define view entity ZHRD_C_LEAVE_CONT
  as projection on ZHRD_I_LEAVE_CONT
{
  key LeaveGuid,
  key ContactNr,
      FullName,
      Email,
      /* Associations */
      _Leave : redirected to parent ZHRD_C_LEAVE
}
