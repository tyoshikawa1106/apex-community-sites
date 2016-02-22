@isTest
private class LeaveRequestWrapperTest {

    private static User testAdminUser = new User(Id = UserInfo.getUserId());

    /**
     * コンストラクタ
     */
    static testMethod void LeaveRequestWrapperTest1() {
        
        System.runAs(testAdminUser) {

            Test.startTest();
            
            LeaveRequestWrapper cls = new LeaveRequestWrapper();
            
            Test.stopTest();
        }
    }
}