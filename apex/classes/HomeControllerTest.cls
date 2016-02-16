@isTest
private class HomeControllerTest {

    private static User testAdminUser = new User(Id = UserInfo.getUserId());

    /**
     * コンストラクタ
     */
    static testMethod void HomeControllerTest() {
        
        System.runAs(testAdminUser) {

            Test.startTest();
            
            HomeController cls = new HomeController();
            cls.init();
            
            Test.stopTest();
        }
    }
}