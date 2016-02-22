@isTest
private class BeingLateLeaveEarlyWrapperTest {

    private static User testAdminUser = new User(Id = UserInfo.getUserId());

    /**
     * コンストラクタ
     */
    static testMethod void BeingLateLeaveEarlyWrapperTest1() {
        
        System.runAs(testAdminUser) {

            Test.startTest();
            
            BeingLateLeaveEarlyWrapper cls = new BeingLateLeaveEarlyWrapper();
            
            Test.stopTest();
        }
    }
}