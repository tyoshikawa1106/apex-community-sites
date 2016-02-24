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
        if (String.isNotEmpty(wrapper.requestType)) {
            leaveRequest.RequestType__c = wrapper.requestType;
        }
        if (String.isNotEmpty(wrapper.approvalUser)) {
            leaveRequest.ApprovalUser__c = wrapper.approvalUser;
        } else {
            leaveRequest.ApprovalUser__c = null;
        }

        return leaveRequest;
    }
}