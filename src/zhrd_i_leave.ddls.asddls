@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Leaves interface view'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity ZHRD_I_LEAVE
  as select from ZHRD_leave
  composition [0..*] of ZHRD_I_LEAVE_CONT    as _Contacts
  association [1..1] to ZHRD_B_EMPLOYEE      as _Requestor    on  $projection.RequestorId = _Requestor.EmployeeId
  association [1..1] to ZHRD_B_EMPLOYEE      as _Approver     on  $projection.ApproverId = _Approver.EmployeeId
  association [1..1] to ZHRD_B_EMPLOYEE      as _Backup       on  $projection.BackupId = _Backup.EmployeeId
  association [1..1] to ZHRD_B_LEAVE_TYPE    as _LeaveType    on  $projection.LeaveTypeId = _LeaveType.LeaveTypeId
  association [1..1] to ZHRD_I_STATUS_DOMAIN as _StatusDomain on  $projection.Status     = _StatusDomain.ValueLow
                                                              and _StatusDomain.Language = 'E'
{
  key leave_guid                                                      as LeaveGuid,
      requestor_id                                                    as RequestorId,
      concat_with_space(_Requestor.FirstName, _Requestor.LastName, 1) as RequestorName,
      leave_type_id                                                   as LeaveTypeId,
      status                                                          as Status,
      date_from                                                       as DateFrom,
      date_to                                                         as DateTo,
      backup_id                                                       as BackupId,
      concat_with_space(_Backup.FirstName, _Backup.LastName, 1)       as BackupName,
      requestor_comment                                               as RequestorComment,
      approver_id                                                     as ApproverId,
      concat_with_space(_Approver.FirstName, _Approver.LastName, 1)   as ApproverName,
      approver_comment                                                as ApproverComment,
      @Semantics.user.createdBy: true
      created_by                                                      as CreatedBy,
      @Semantics.systemDateTime.createdAt: true
      created_at                                                      as CreatedAt,
      @Semantics.user.lastChangedBy: true
      last_changed_by                                                 as LastChangedBy,
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at                                                 as LastChangedAt,
      _Contacts,
      _Requestor,
      _Approver,
      _Backup,
      _LeaveType,
      _StatusDomain
}
