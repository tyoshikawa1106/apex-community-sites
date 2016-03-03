public with sharing class LeaveRequestDao {

    /**
     * コンストラクタ
     */
    public LeaveRequestDao() {
        
    }

    /**
     * 休暇申請情報リスト取得
     */
    public List<LeaveRequest__c> getLeaveRequests() {
        return [
            SELECT
                 Id
                ,Date__c
                ,Description__c
                ,RequestType__c
                ,ApprovalUser__c
                ,ApprovalUser__r.Name
                ,ApprovalUser__r.SmallPhotoUrl
                ,IsApproval__c
            FROM
                LeaveRequest__c
            WHERE
                OwnerId =: UserInfo.getUserId()
            ORDER BY Date__c DESC
            LIMIT 200
        ];
    }

    /**
     * 休暇申請情報取得
     */
    public LeaveRequest__c getLeaveRequest(String recordId) {
        List<LeaveRequest__c> leaveRequests = [
            SELECT
                 Id
                ,Date__c
                ,Description__c
                ,RequestType__c
                ,ApprovalUser__c
                ,ApprovalUser__r.Name
                ,ApprovalUser__r.SmallPhotoUrl
                ,IsApproval__c
            FROM
                LeaveRequest__c
            WHERE
                Id =: recordId
            AND
                OwnerId =: UserInfo.getUserId()
            LIMIT 1
        ];

        return leaveRequests.isEmpty() ? new LeaveRequest__c() : leaveRequests[0];
    }

    /**
     * 削除対象の休暇申請情報取得
     */
    public List<LeaveRequest__c> getDeleteLeaveRequests(String recordId) {
        return [
            SELECT
                Id
            FROM
                LeaveRequest__c
            WHERE
                Id =: recordId
            AND
                OwnerId =: UserInfo.getUserId()
            LIMIT 1
        ];
    }

    /**
     * 承認ユーザの情報取得
     */
    public List<User> getApprovalUsers(String userName) {
        String key = userName + '%';
        return [SELECT Id,Name,SmallPhotoUrl FROM User WHERE IsActive = true AND Name LIKE: key LIMIT 200];
    }

    /**
     * 承認履歴情報取得(ProcessInstance)
     */
    public List<ProcessInstance> getProcessInstances(String targetObjectId) {
        return [
            SELECT
                 Id
                ,CompletedDate
                ,LastActorId
                ,ProcessDefinitionId
                ,Status
                ,TargetObjectId
                ,(
                    SELECT 
                         Id
                        ,ActorId
                        ,Comments
                        ,IsPending
                        ,OriginalActorId
                        ,ProcessInstanceId
                        ,ProcessNodeId
                        ,toLabel(StepStatus)
                        ,TargetObjectId
                        ,CreatedDate
                    FROM
                        StepsAndWorkitems
                    ORDER BY CreatedDate DESC
                )
            FROM
                ProcessInstance
            WHERE
                TargetObjectId =: targetObjectId
            ORDER BY CreatedDate DESC
            LIMIT 50
        ];
    }

    /**
     * ユーザ情報取得
     */
    public List<User> getActorUsers(Set<Id> userIds) {
        return [SELECT Id,Name FROM User WHERE Id IN: userIds];
    }
}