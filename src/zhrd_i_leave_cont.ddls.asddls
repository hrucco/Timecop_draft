@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Leave contacts interface view'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZHRD_I_LEAVE_CONT
  as select from ZHRD_leave_cont
  association to parent ZHRD_I_LEAVE as _Leave on $projection.LeaveGuid = _Leave.LeaveGuid
{
  key leave_guid as LeaveGuid,
@EndUserText.label: 'Contact Number'  
  key contact_nr as ContactNr,
@EndUserText.label: 'Contact Name'  
      full_name  as FullName,
      email      as Email,
      _Leave // Make association public
}
