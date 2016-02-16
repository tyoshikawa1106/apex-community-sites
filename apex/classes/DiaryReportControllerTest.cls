@isTest
private class DiaryReportControllerTest {

    private static User testAdminUser = new User(Id = UserInfo.getUserId());

    /**
     * コンストラクタ
     */
    static testMethod void DiaryReportControllerTest() {
        
        System.runAs(testAdminUser) {

            Test.startTest();
            
            DiaryReportController cls = new DiaryReportController();
            cls.init();
            
            Test.stopTest();
        }
    }

    /**
     * 日報情報リストの取得
     * 値なし
     */
    static testMethod void getDiaryReportsTest1() {
        
        System.runAs(testAdminUser) {

            Test.startTest();
            
            List<DiaryReport__c> results = DiaryReportController.getDiaryReports();
            
            Test.stopTest();
        }
    }

    /**
     * 日報情報の取得
     * 値なし
     */
    static testMethod void getDiaryReportTest1() {
        
        System.runAs(testAdminUser) {

            String recordId = '';

            Test.startTest();
            
            DiaryReport__c result = DiaryReportController.getDiaryReport(recordId);
            System.assertEquals(String.isEmpty(result.Id), true);
            
            Test.stopTest();
        }
    }

    /**
     * 日報情報の登録
     * 値なし
     */
    static testMethod void saveDiaryReportTest1() {
        
        System.runAs(testAdminUser) {

            DiaryReport__c diaryReport = new DiaryReport__c();

            Test.startTest();
            
            RemoteActionResult result = DiaryReportController.saveDiaryReport(diaryReport);
            
            Test.stopTest();

            System.assertEquals(String.isEmpty(result.recordId), true);
            System.assertEquals(result.errorMessages.size(), 1);
        }
    }

    /**
     * 日報情報の登録
     * 値あり
     */
    static testMethod void saveDiaryReportTest2() {
        
        System.runAs(testAdminUser) {

            DiaryReport__c diaryReport = new DiaryReport__c(
                 Title__c = 'Sample'
                ,Date__c = System.today()
            );

            Test.startTest();
            
            RemoteActionResult result = DiaryReportController.saveDiaryReport(diaryReport);
            
            Test.stopTest();

            System.assertEquals(String.isNotEmpty(result.recordId), true);
            System.assertEquals(result.errorMessages.size(), 0);
        }
    }

    /**
     * 日報情報の削除
     * 値なし
     */
    static testMethod void deleteDiaryReportTest1() {
        
        System.runAs(testAdminUser) {

            String deleteId = '';

            Test.startTest();
            
            DiaryReportController.deleteDiaryReport(deleteId);
            
            Test.stopTest();
        }
    }
}