@isTest
private class LeaveRequestDaoTest {

    private static LeaveRequestDao dao = new LeaveRequestDao();
    private static User testAdminUser = new User(Id = UserInfo.getUserId());

    /**
     * 休暇申請情報リスト取得
     * 値なし
     */
    static testMethod void getLeaveRequestsTest1() {
        
        System.runAs(testAdminUser) {

            Test.startTest();
            
            List<LeaveRequest__c> results = dao.getLeaveRequests();
            
            Test.stopTest();

            System.assertEquals(results.size(), 0);
        }
    }

    /**
     * 休暇申請情報取得
     * 値なし
     */
    static testMethod void getLeaveRequestTest1() {
        
        System.runAs(testAdminUser) {

            String recordId = '';

            Test.startTest();
            
            LeaveRequest__c result = dao.getLeaveRequest(recordId);
            
            Test.stopTest();

            System.assertEquals(String.isEmpty(result.Id), true);
        }
    }

    /**
     * 削除対象の休暇申請情報取得
     * 値なし
     */
    static testMethod void getDeleteLeaveRequestsTest1() {
        
        System.runAs(testAdminUser) {

            String recordId = '';

            Test.startTest();
            
            List<LeaveRequest__c> results = dao.getDeleteLeaveRequests(recordId);
            
            Test.stopTest();

            System.assertEquals(results.isEmpty(), true);
        }
    }

    /**
     * ユーザ情報取得
     */
    static testMethod void getApprovalUsersTest1() {
        
        System.runAs(testAdminUser) {

            String userName = '';

            Test.startTest();
            
            List<User> results = dao.getApprovalUsers(userName);
            
            Test.stopTest();

            System.assertEquals(results.isEmpty(), false);
        }
    }

    /**
     * 承認履歴情報取得(ProcessInstance)
     * 値なし
     */
    static testMethod void getProcessInstanceTest1() {
        
        System.runAs(testAdminUser) {

            String targetObjectId = '';

            Test.startTest();
            
            List<ProcessInstance> results = dao.getProcessInstances(targetObjectId);
            
            Test.stopTest();

            System.assertEquals(results.isEmpty(), true);
        }
    }

    /**
     * 承認履歴情報取得(ProcessInstance)
     * 値あり
     */
    static testMethod void getProcessInstanceTest2() {
        
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

            String targetObjectId = leaveRequest.Id;

            Test.startTest();
            
            List<ProcessInstance> results = dao.getProcessInstances(targetObjectId);
            
            Test.stopTest();

            System.assertEquals(results.size(), 1);
            System.assertEquals(results[0].StepsAndWorkitems.size(), 0);
        }
    }

    /**
     * ユーザ情報取得
     * 値なし
     */
    static testMethod void getActorUsersTest1() {
        
        System.runAs(testAdminUser) {

            Set<Id> userIds = new Set<Id>();

            Test.startTest();
            
            List<User> results = dao.getActorUsers(userIds);
            
            Test.stopTest();

            System.assertEquals(results.size(), 0);
        }
    }

    /**
     * ユーザ情報取得
     * 値あり
     */
    static testMethod void getActorUsersTest2() {
        
        System.runAs(testAdminUser) {

            Set<Id> userIds = new Set<Id>{testAdminUser.Id};

            Test.startTest();
            
            List<User> results = dao.getActorUsers(userIds);
            
            Test.stopTest();

            System.assertEquals(results.size(), 1);
        }
    }
}