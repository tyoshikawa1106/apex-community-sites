public with sharing class LeaveRequestWrapper {

    public Id recordId {get; set;}
    public Date leaveDate {get; set;}
    public String description {get; set;}
    public String requestType {get; set;}
    public String approvalUser {get; set;}
    public String approvalUserName {get; set;}
    public String approvalUserPhotoUrl {get; set;}
    public Boolean isApproval {get; set;}

    /**
     * コンストラクタ
     */
    public LeaveRequestWrapper() {
        this.recordId = null;
        this.leaveDate = null;
        this.description = '';
        this.requestType = '';
        this.approvalUser = '';
        this.approvalUserName = '';
        this.approvalUserPhotoUrl = '';
        this.isApproval = false;
    }

    /**
     * コンストラクタ
     */
    public LeaveRequestWrapper(LeaveRequest__c leaveRequest) {
        this.recordId = leaveRequest.Id;
        this.leaveDate = leaveRequest.Date__c;
        this.description = leaveRequest.Description__c;
        this.requestType = leaveRequest.RequestType__c;
        this.approvalUser = leaveRequest.ApprovalUser__c;
        this.approvalUserName = leaveRequest.ApprovalUser__r.Name;
        this.approvalUserPhotoUrl = leaveRequest.ApprovalUser__r.SmallPhotoUrl;
        this.isApproval = leaveRequest.IsApproval__c;
    }
}