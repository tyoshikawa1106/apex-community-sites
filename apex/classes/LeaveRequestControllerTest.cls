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
            
            LeaveRequestController.deleteLeaveRequest(deleteId);
            
            Test.stopTest();
        }
    }
}