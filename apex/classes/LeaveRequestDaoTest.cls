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
}