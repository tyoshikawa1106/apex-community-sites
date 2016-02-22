public with sharing class BeingLateLeaveEarlyWrapper {

    public Id recordId {get; set;}
    public Date targetDate {get; set;}
    public String description {get; set;}

    /**
     * コンストラクタ
     */
    public BeingLateLeaveEarlyWrapper() {
        this.recordId = null;
        this.targetDate = null;
        this.description = '';
    }

    /**
     * コンストラクタ
     */
    public BeingLateLeaveEarlyWrapper(BeingLateLeaveEarly__c beingLateLeaveEarly) {
        this.recordId = beingLateLeaveEarly.Id;
        this.targetDate = beingLateLeaveEarly.Date__c;
        this.description = beingLateLeaveEarly.Description__c;
    }
}