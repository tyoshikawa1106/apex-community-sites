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

    /**
     * レコードロック判定
     */
    public Boolean checkRecordLocked(Id recordId) {
        if (String.isNotEmpty(recordId)) {
            if (System.Approval.isLocked(recordId)) {
                return true;
            }
        }
        return false;
    }

    /**
     * ユーザID取得
     */
    public Set<Id> getActorIds(List<ProcessInstance> processInstances) {
        Set<Id> userIds = new Set<Id>();
        for (ProcessInstance p : processInstances) {
            for (ProcessInstanceHistory history : p.StepsAndWorkitems) {
                userIds.add(history.ActorId);
                userIds.add(history.OriginalActorId);
            }
        }
        return userIds;
    }

    /**
     * 戻り値リスト取得
     */
    public List<LeaveRequestProcessInstanceInfo> getLeaveRequestProcessInstanceInfoList(List<ProcessInstance> processInstances, Map<Id, User> userMap) {
        List<LeaveRequestProcessInstanceInfo> results = new List<LeaveRequestProcessInstanceInfo>();
        for (ProcessInstance p : processInstances) {
            results.add(new LeaveRequestProcessInstanceInfo(p, userMap));
        }
        return results;
    }
}