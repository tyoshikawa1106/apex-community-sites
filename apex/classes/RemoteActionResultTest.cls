@isTest
private class RemoteActionResultTest {

    private static User testAdminUser = new User(Id = UserInfo.getUserId());

    /**
     * コンストラクタ
     */
    static testMethod void RemoteActionResultTest() {
        
        System.runAs(testAdminUser) {

            Test.startTest();
            
            RemoteActionResult cls = new RemoteActionResult();
            
            Test.stopTest();

            System.assertEquals(String.isEmpty(cls.recordId), true);
            System.assertEquals(cls.errorMessages.size(), 0);
        }
    }
}