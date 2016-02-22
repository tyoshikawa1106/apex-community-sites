public with sharing class BeingLateLeaveEarlyHelper {
    
    /**
     * コンストラクタ
     */
    public BeingLateLeaveEarlyHelper() {

    }

    /**
     * 勤怠情報に値をセット
     */
    public BeingLateLeaveEarly__c setBeingLateLeaveEarly(BeingLateLeaveEarlyWrapper wrapper) {
        BeingLateLeaveEarly__c beingLateLeaveEarly = new BeingLateLeaveEarly__c();
        if (String.isNotEmpty(wrapper.recordId)) {
            beingLateLeaveEarly.Id = wrapper.recordId;
        }
        if (wrapper.targetDate != null) {
            beingLateLeaveEarly.Date__c = wrapper.targetDate;
        }
        if (String.isNotEmpty(wrapper.description)) {
            beingLateLeaveEarly.Description__c = wrapper.description;
        }

        return beingLateLeaveEarly;
    }
}