@isTest
private class BeingLateLeaveEarlyDaoTest {

    private static BeingLateLeaveEarlyDao dao = new BeingLateLeaveEarlyDao();
    private static User testAdminUser = new User(Id = UserInfo.getUserId());

    /**
     * 遅刻早退情報リスト取得
     * 値なし
     */
    static testMethod void getBeingLateLeaveEarlysTest1() {
        
        System.runAs(testAdminUser) {

            Test.startTest();
            
            List<BeingLateLeaveEarly__c> results = dao.getBeingLateLeaveEarlys();
            
            Test.stopTest();

            System.assertEquals(results.size(), 0);
        }
    }

    /**
     * 遅刻早退情報取得
     * 値なし
     */
    static testMethod void getBeingLateLeaveEarlyTest1() {
        
        System.runAs(testAdminUser) {

            String recordId = '';

            Test.startTest();
            
            BeingLateLeaveEarly__c result = dao.getBeingLateLeaveEarly(recordId);
            
            Test.stopTest();

            System.assertEquals(String.isEmpty(result.Id), true);
        }
    }

    /**
     * 削除対象の遅刻早退情報取得
     * 値なし
     */
    static testMethod void getDeleteBeingLateLeaveEarlysTest1() {
        
        System.runAs(testAdminUser) {

            String recordId = '';

            Test.startTest();
            
            List<BeingLateLeaveEarly__c> results = dao.getDeleteBeingLateLeaveEarlys(recordId);
            
            Test.stopTest();

            System.assertEquals(results.isEmpty(), true);
        }
    }
}