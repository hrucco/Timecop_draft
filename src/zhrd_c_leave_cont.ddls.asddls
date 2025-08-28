@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Leave contacts projection view'
@Metadata.allowExtensions: true
define view entity zhrd_C_LEAVE_CONT
  as projection on zhrd_I_LEAVE_CONT
{
  key LeaveGuid,
  key ContactNr,
      FullName,
      Email,
      /* Associations */
      _Leave : redirected to parent zhrd_C_LEAVE
}
