@isTest
private class WorkTimeControllerTest {

    private static User testAdminUser = new User(Id = UserInfo.getUserId());

    /**
     * コンストラクタ
     */
    static testMethod void WorkTimeControllerTest() {
        
        System.runAs(testAdminUser) {

            Test.startTest();
            
            WorkTimeController cls = new WorkTimeController();
            cls.init();
            
            Test.stopTest();
        }
    }

    /**
     * 勤怠情報リストの取得
     * 値なし
     */
    static testMethod void getWorkTimesTest1() {
        
        System.runAs(testAdminUser) {

            Test.startTest();
            
            List<WorkTimeWrapper> results = WorkTimeController.getWorkTimes();
            
            Test.stopTest();
        }
    }

    /**
     * 勤怠情報の取得
     * 値なし
     */
    static testMethod void getWorkTimeTest1() {
        
        System.runAs(testAdminUser) {

            String recordId = '';

            Test.startTest();
            
            WorkTimeWrapper result = WorkTimeController.getWorkTime(recordId);
            System.assertEquals(String.isEmpty(result.recordId), true);
            
            Test.stopTest();
        }
    }

    /**
     * 勤怠情報の登録
     * 値なし
     */
    static testMethod void saveWorkTimeTest1() {
        
        System.runAs(testAdminUser) {

            WorkTimeWrapper wrapper = new WorkTimeWrapper();

            Test.startTest();
            
            RemoteActionResult result = WorkTimeController.saveWorkTime(wrapper);
            
            Test.stopTest();

            System.assertEquals(String.isNotEmpty(result.recordId), true);
            System.assertEquals(result.errorMessages.size(), 0);
        }
    }

    /**
     * 勤怠情報の登録
     * 値あり
     */
    static testMethod void saveWorkTimeTest2() {
        
        System.runAs(testAdminUser) {

            WorkTime__c workTime = new WorkTime__c(
                Date__c = System.today()
            );
            WorkTimeWrapper wrapper = new WorkTimeWrapper(workTime);

            Test.startTest();
            
            RemoteActionResult result = WorkTimeController.saveWorkTime(wrapper);
            
            Test.stopTest();

            System.assertEquals(String.isNotEmpty(result.recordId), true);
            System.assertEquals(result.errorMessages.size(), 0);
        }
    }

    /**
     * 勤怠情報の削除
     * 値なし
     */
    static testMethod void deleteWorkTimeTest1() {
        
        System.runAs(testAdminUser) {

            String deleteId = '';

            Test.startTest();
            
            WorkTimeController.deleteWorkTime(deleteId);
            
            Test.stopTest();
        }
    }
}