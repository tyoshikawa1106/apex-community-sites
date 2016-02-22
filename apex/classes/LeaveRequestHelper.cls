public with sharing class LeaveRequestHelper {
    
    /**
     * コンストラクタ
     */
    public LeaveRequestHelper() {

    }

    /**
     * 休暇申請情報に値をセット
     */
    public LeaveRequest__c setLeaveRequest(LeaveRequestWrapper wrapper) {
        LeaveRequest__c leaveRequest = new LeaveRequest__c();
        if (String.isNotEmpty(wrapper.recordId)) {
            leaveRequest.Id = wrapper.recordId;
        }
        if (wrapper.leaveDate != null) {
            leaveRequest.Date__c = wrapper.leaveDate;
        }
        if (String.isNotEmpty(wrapper.description)) {
            leaveRequest.Description__c = wrapper.description;
        }

        return leaveRequest;
    }
}