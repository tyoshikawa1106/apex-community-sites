@isTest
private class WorkTimeWrapperTest {

    private static User testAdminUser = new User(Id = UserInfo.getUserId());

    /**
     * コンストラクタ
     */
    static testMethod void WorkTimeWrapperTest1() {
        
        System.runAs(testAdminUser) {

            Test.startTest();
            
            WorkTimeWrapper cls = new WorkTimeWrapper();
            
            Test.stopTest();
        }
    }
}