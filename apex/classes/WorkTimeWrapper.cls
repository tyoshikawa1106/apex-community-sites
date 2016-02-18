public with sharing class WorkTimeWrapper {

    public Id recordId {get; set;}
    public Date workDate {get; set;}
    public String description {get; set;}

    /**
     * コンストラクタ
     */
    public WorkTimeWrapper() {
        this.recordId = null;
        this.workDate = null;
        this.description = '';
    }

    /**
     * コンストラクタ
     */
    public WorkTimeWrapper(WorkTime__c workTime) {
        this.recordId = workTime.Id;
        this.workDate = workTime.Date__c;
        this.description = workTime.Description__c;
    }
}