public with sharing class WorkTimeWrapper {

    public Id recordId {get; set;}
    public DateTime workDate {get; set;}
    public String description {get; set;}
    public DateTime startTime {get; set;}
    public DateTime endTime {get; set;}

    /**
     * コンストラクタ
     */
    public WorkTimeWrapper() {
        this.recordId = null;
        this.workDate = null;
        this.description = '';
        this.startTime = null;
        this.endTime = null;
    }

    /**
     * コンストラクタ
     */
    public WorkTimeWrapper(WorkTime__c workTime) {
        this.recordId = workTime.Id;
        this.workDate = workTime.Date__c;
        this.description = workTime.Description__c;
        this.startTime = workTime.WorkStartTime__c;
        this.endTime = workTime.WorkEndTime__c;
    }
}