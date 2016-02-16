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
}