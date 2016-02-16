@isTest
private class PartnerLoginControllerTest {

    private static User testAdminUser = new User(Id = UserInfo.getUserId());

    /**
     * コンストラクタ
     */
    static testMethod void PartnerLoginControllerTest() {
        
        System.runAs(testAdminUser) {

            Test.startTest();
            
            PartnerLoginController cls = new PartnerLoginController();
            System.assertEquals(String.isEmpty(cls.userId), true);
            System.assertEquals(String.isEmpty(cls.password), true);
            System.assertEquals(String.isEmpty(cls.errorMessage), true);
            
            Test.stopTest();
        }
    }

    /**
     * 初期処理
     * システム管理者でログイン済み
     */
    static testMethod void initTest1() {
        
        System.runAs(testAdminUser) {

            Test.startTest();
            
            PartnerLoginController cls = new PartnerLoginController();
            PageReference result = cls.init();
            System.assertEquals(result.getUrl(), Page.Home.getUrl());
            
            Test.stopTest();
        }
    }

    /**
     * ログイン
     * 不正なログイン情報
     */
    static testMethod void doLoginTest1() {
        
        System.runAs(testAdminUser) {

            Test.startTest();
            
            PartnerLoginController cls = new PartnerLoginController();
            cls.userId = 'sample';
            cls.password = 'xxxxxx';
            PageReference result = cls.doLogin();
            System.assertEquals(result, null);
            System.assertEquals(String.isNotEmpty(cls.errorMessage), true);
            
            Test.stopTest();
        }
    }
}