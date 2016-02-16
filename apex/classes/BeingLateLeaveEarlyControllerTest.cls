@isTest
private class BeingLateLeaveEarlyControllerTest {

    private static User testAdminUser = new User(Id = UserInfo.getUserId());

    /**
     * コンストラクタ
     */
    static testMethod void BeingLateLeaveEarlyControllerTest() {
        
        System.runAs(testAdminUser) {

            Test.startTest();
            
            BeingLateLeaveEarlyController cls = new BeingLateLeaveEarlyController();
            cls.init();
            
            Test.stopTest();
        }
    }
}