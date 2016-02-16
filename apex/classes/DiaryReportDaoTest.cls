@isTest
private class DiaryReportDaoTest {

    private static DiaryReportDao dao = new DiaryReportDao();
    private static User testAdminUser = new User(Id = UserInfo.getUserId());

    /**
     * 日報情報リスト取得
     * 値なし
     */
    static testMethod void getDiaryReportsTest1() {
        
        System.runAs(testAdminUser) {

            Test.startTest();
            
            List<DiaryReport__c> results = dao.getDiaryReports();
            
            Test.stopTest();

            System.assertEquals(results.size(), 0);
        }
    }

    /**
     * 日報情報取得
     * 値なし
     */
    static testMethod void getDiaryReportTest1() {
        
        System.runAs(testAdminUser) {

            String recordId = '';

            Test.startTest();
            
            DiaryReport__c result = dao.getDiaryReport(recordId);
            
            Test.stopTest();

            System.assertEquals(String.isEmpty(result.Id), true);
        }
    }

    /**
     * 削除対象の日報情報取得
     * 値なし
     */
    static testMethod void getDeleteDiaryReportsTest1() {
        
        System.runAs(testAdminUser) {

            String recordId = '';

            Test.startTest();
            
            List<DiaryReport__c> results = dao.getDeleteDiaryReports(recordId);
            
            Test.stopTest();

            System.assertEquals(results.isEmpty(), true);
        }
    }
}