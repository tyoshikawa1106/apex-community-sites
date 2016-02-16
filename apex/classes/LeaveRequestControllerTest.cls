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
}