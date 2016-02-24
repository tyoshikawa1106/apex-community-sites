public with sharing class WorkTimeHelper {
    
    /**
     * コンストラクタ
     */
    public WorkTimeHelper() {

    }

    /**
     * 勤怠情報に値をセット
     */
    public WorkTime__c setWorkTime(WorkTimeWrapper wrapper) {
        WorkTime__c workTime = new WorkTime__c();
        if (String.isNotEmpty(wrapper.recordId)) {
            workTime.Id = wrapper.recordId;
        }
        if (wrapper.workDate != null) {
            workTime.Date__c = wrapper.workDate;
        }
        if (wrapper.startTime != null) {
            workTime.WorkStartTime__c = wrapper.startTime;
        }
        if (wrapper.endTime != null) {
            workTime.WorkEndTime__c = wrapper.endTime;
        }
        if (String.isNotEmpty(wrapper.description)) {
            workTime.Description__c = wrapper.description;
        }

        return workTime;
    }
}