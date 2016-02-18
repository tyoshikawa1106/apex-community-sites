@isTest
private class WorkTimeDaoTest {

    private static WorkTimeDao dao = new WorkTimeDao();
    private static User testAdminUser = new User(Id = UserInfo.getUserId());

    /**
     * 勤怠情報リスト取得
     * 値なし
     */
    static testMethod void getWorkTimesTest1() {
        
        System.runAs(testAdminUser) {

            Test.startTest();
            
            List<WorkTime__c> results = dao.getWorkTimes();
            
            Test.stopTest();

            System.assertEquals(results.size(), 0);
        }
    }

    /**
     * 勤怠情報取得
     * 値なし
     */
    static testMethod void getWorkTimeTest1() {
        
        System.runAs(testAdminUser) {

            String recordId = '';

            Test.startTest();
            
            WorkTime__c result = dao.getWorkTime(recordId);
            
            Test.stopTest();

            System.assertEquals(String.isEmpty(result.Id), true);
        }
    }

    /**
     * 削除対象の勤怠情報取得
     * 値なし
     */
    static testMethod void getDeleteWorkTimesTest1() {
        
        System.runAs(testAdminUser) {

            String recordId = '';

            Test.startTest();
            
            List<WorkTime__c> results = dao.getDeleteWorkTimes(recordId);
            
            Test.stopTest();

            System.assertEquals(results.isEmpty(), true);
        }
    }
}