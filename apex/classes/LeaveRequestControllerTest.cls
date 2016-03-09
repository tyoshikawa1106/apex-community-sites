@isTest
private class LeaveRequestControllerTest {

    private static User testAdminUser = new User(Id = UserInfo.getUserId());

    /**
     * コンストラクタ
     */
    static testMethod void LeaveRequestControllerTest() {
        
        System.runAs(testAdminUser) {

            Test.startTest();
            
            LeaveRequestController cls = new LeaveRequestController();
            cls.init();
            
            Test.stopTest();
        }
    }

    /**
     * 休暇申請情報リストの取得
     * 値なし
     */
    static testMethod void getLeaveRequestsTest1() {
        
        System.runAs(testAdminUser) {

            Test.startTest();
            
            List<LeaveRequestWrapper> results = LeaveRequestController.getLeaveRequests();
            
            Test.stopTest();
        }
    }

    /**
     * 休暇申請情報の取得
     * 値なし
     */
    static testMethod void getLeaveRequestTest1() {
        
        System.runAs(testAdminUser) {

            String recordId = '';

            Test.startTest();
            
            LeaveRequestWrapper result = LeaveRequestController.getLeaveRequest(recordId);
            System.assertEquals(String.isEmpty(result.recordId), true);
            
            Test.stopTest();
        }
    }

    /**
     * 休暇申請情報の登録
     * 値なし
     */
    static testMethod void saveLeaveRequestTest1() {
        
        System.runAs(testAdminUser) {

            LeaveRequestWrapper wrapper = new LeaveRequestWrapper();

            Test.startTest();
            
            RemoteActionResult result = LeaveRequestController.saveLeaveRequest(wrapper);
            
            Test.stopTest();

            System.assertEquals(String.isEmpty(result.recordId), true);
            System.assertEquals(result.errorMessages.size(), 1);
        }
    }

    /**
     * 休暇申請情報の登録
     * 値あり
     */
    static testMethod void saveLeaveRequestTest2() {
        
        System.runAs(testAdminUser) {

            LeaveRequest__c leaveRequest = new LeaveRequest__c(
                 Date__c = System.today()
                ,ApprovalUser__c = testAdminUser.Id
            );
            LeaveRequestWrapper wrapper = new LeaveRequestWrapper(leaveRequest);

            Test.startTest();
            
            RemoteActionResult result = LeaveRequestController.saveLeaveRequest(wrapper);
            
            Test.stopTest();

            System.assertEquals(String.isNotEmpty(result.recordId), true);
            System.assertEquals(result.errorMessages.size(), 0);
        }
    }

    /**
     * 休暇申請情報の削除
     * 値なし
     */
    static testMethod void deleteLeaveRequestTest1() {
        
        System.runAs(testAdminUser) {

            String deleteId = '';

            Test.startTest();
            
            RemoteActionResult result = LeaveRequestController.deleteLeaveRequest(deleteId);
            
            Test.stopTest();

            System.assertEquals(result.errorMessages.size(), 1);
        }
    }

    /**
     * 休暇申請情報の削除
     * 値あり
     */
    static testMethod void deleteLeaveRequestTest2() {
        
        System.runAs(testAdminUser) {

            LeaveRequest__c leaveRequest = new LeaveRequest__c(
                 Date__c = System.today()
                ,ApprovalUser__c = testAdminUser.Id
            );
            insert leaveRequest;

            String deleteId = leaveRequest.Id;

            Test.startTest();
            
            RemoteActionResult result = LeaveRequestController.deleteLeaveRequest(deleteId);
            
            Test.stopTest();

            Integer resultCnt = [SELECT COUNT() FROM LeaveRequest__c WHERE Id =: leaveRequest.Id LIMIT 1];
            System.assertEquals(resultCnt, 0);
            System.assertEquals(result.errorMessages.size(), 0);
        }
    }

    /**
     * 休暇申請情報の削除
     */
    static testMethod void getApprovalUsersTest1() {
        
        System.runAs(testAdminUser) {

            String userName = '';

            Test.startTest();
            
            List<User> results = LeaveRequestController.getApprovalUsers(userName);
            
            Test.stopTest();

            System.assertEquals(results.isEmpty(), false);
        }
    }

    /**
     * 承認履歴の情報取得
     */
    static testMethod void getProcessInstanceInfoTest1() {
        
        System.runAs(testAdminUser) {

            String recordId = '';

            Test.startTest();
            
            List<LeaveRequestProcessInstanceInfo> results = LeaveRequestController.getProcessInstanceInfo(recordId);
            
            Test.stopTest();

            System.assertEquals(results.isEmpty(), true);
        }
    }

    /**
     * 休暇申請情報の承認申請
     * recordIdなし
     */
    static testMethod void requestApprovalByApexTest1() {
        
        System.runAs(testAdminUser) {

            String recordId = '';
            String nextApproverId = '';

            Test.startTest();
            
            RemoteActionResult result = LeaveRequestController.requestApprovalByApex(recordId, nextApproverId);
            
            Test.stopTest();

            System.assertEquals(result.errorMessages.isEmpty(), false);
        }
    }

    /**
     * 休暇申請情報の承認申請
     * nextApproverIdなし
     */
    static testMethod void requestApprovalByApexTest2() {
        
        System.runAs(testAdminUser) {

            LeaveRequest__c leaveRequest = new LeaveRequest__c(
                 Date__c = System.today()
                ,ApprovalUser__c = testAdminUser.Id
            );
            insert leaveRequest;

            String recordId = leaveRequest.Id;
            String nextApproverId = '';

            Test.startTest();
            
            RemoteActionResult result = LeaveRequestController.requestApprovalByApex(recordId, nextApproverId);
            
            Test.stopTest();

            System.assertEquals(result.errorMessages.isEmpty(), true);
        }
    }

    /**
     * 休暇申請情報の承認申請
     * nextApproverIdあり
     */
    static testMethod void requestApprovalByApexTest3() {
        
        System.runAs(testAdminUser) {

            LeaveRequest__c leaveRequest = new LeaveRequest__c(
                 Date__c = System.today()
                ,ApprovalUser__c = testAdminUser.Id
            );
            insert leaveRequest;

            String recordId = leaveRequest.Id;
            String nextApproverId = testAdminUser.Id;

            Test.startTest();
            
            RemoteActionResult result = LeaveRequestController.requestApprovalByApex(recordId, nextApproverId);
            
            Test.stopTest();

            System.assertEquals(result.errorMessages.isEmpty(), true);
        }
    }

    /**
     * 休暇申請情報の承認申請
     * レコードロック
     */
    static testMethod void requestApprovalByApexTest4() {
        
        System.runAs(testAdminUser) {

            LeaveRequest__c leaveRequest = new LeaveRequest__c(
                 Date__c = System.today()
                ,ApprovalUser__c = testAdminUser.Id
            );
            insert leaveRequest;
            // レコードロック
            Approval.LockResult lockResult = Approval.lock(leaveRequest, false);

            String recordId = leaveRequest.Id;
            String nextApproverId = testAdminUser.Id;

            Test.startTest();
            
            RemoteActionResult result = LeaveRequestController.requestApprovalByApex(recordId, nextApproverId);
            
            Test.stopTest();

            System.assertEquals(result.errorMessages.isEmpty(), false);
        }
    }
}