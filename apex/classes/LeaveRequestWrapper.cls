public with sharing class LeaveRequestWrapper {

    public Id recordId {get; set;}
    public Date leaveDate {get; set;}
    public String description {get; set;}

    /**
     * コンストラクタ
     */
    public LeaveRequestWrapper() {
        this.recordId = null;
        this.leaveDate = null;
        this.description = '';
    }

    /**
     * コンストラクタ
     */
    public LeaveRequestWrapper(LeaveRequest__c leaveRequest) {
        this.recordId = leaveRequest.Id;
        this.leaveDate = leaveRequest.Date__c;
        this.description = leaveRequest.Description__c;
    }
}