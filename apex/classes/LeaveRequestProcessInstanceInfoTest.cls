@isTest
private class LeaveRequestProcessInstanceInfoTest {

    private static User testAdminUser = new User(Id = UserInfo.getUserId());

    /**
     * コンストラクタ
     */
    static testMethod void LeaveRequestProcessInstanceInfoTest1() {
        
        System.runAs(testAdminUser) {

            Test.startTest();
            
            LeaveRequestProcessInstanceInfo cls = new LeaveRequestProcessInstanceInfo();
            
            Test.stopTest();

            System.assertEquals(String.isEmpty(cls.processInstance.Id), true);
        }
    }

    /**
     * コンストラクタ
     */
    static testMethod void LeaveRequestProcessInstanceInfoTest2() {
        
        System.runAs(testAdminUser) {

            // 休暇申請テストデータ
            LeaveRequest__c leaveRequest = new LeaveRequest__c(Date__c = System.today(), ApprovalUser__c = testAdminUser.Id);
            insert leaveRequest;
            System.assertEquals(String.isNotEmpty(leaveRequest.Id), true);

            // 承認申請テストデータ
            Approval.ProcessSubmitRequest psr = new Approval.ProcessSubmitRequest();
            psr.setObjectId(leaveRequest.Id);
            psr.setNextApproverIds(new Id[] {leaveRequest.ApprovalUser__c});
            Approval.ProcessResult submitResult = Approval.process(psr);
            System.assert(submitResult.isSuccess());

            ProcessInstance processInstance = [SELECT Id FROM ProcessInstance WHERE TargetObjectId =: leaveRequest.Id AND Status = 'Pending' LIMIT 1];
            Map<Id, User> userMap = new Map<Id, User>();

            Test.startTest();
            
            LeaveRequestProcessInstanceInfo cls = new LeaveRequestProcessInstanceInfo(processInstance, userMap);
            
            Test.stopTest();

            System.assertEquals(String.isNotEmpty(cls.processInstance.Id), true);
        }
    }

    /**
     * コンストラクタ
     */
    static testMethod void LeaveRequestProcessInstanceInfoDetailTest1() {
        
        System.runAs(testAdminUser) {

            Test.startTest();
            
            LeaveRequestProcessInstanceInfo.LeaveRequestProcessInstanceInfoDetail cls = new LeaveRequestProcessInstanceInfo.LeaveRequestProcessInstanceInfoDetail();
            
            Test.stopTest();

            System.assertEquals(cls.completedDate, null);
        }
    }
}