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

    /**
     * ユーザ情報の取得
     */
    static testMethod void getLoginUserTest() {
        
        System.runAs(testAdminUser) {

            Test.startTest();
            
            User result = HomeController.getLoginUser();
            
            Test.stopTest();

            System.assertEquals(String.isNotEmpty(result.Id), true);
        }
    }
}