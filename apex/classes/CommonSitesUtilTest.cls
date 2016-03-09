@isTest
private class CommonSitesUtilTest {

    private static User testAdminUser = new User(Id = UserInfo.getUserId());

    /**
     * ログイン判定
     * システム管理者ユーザ
     */
    static testMethod void isLoginTest() {
        
        System.runAs(testAdminUser) {

            Test.startTest();
            
            PageReference result = CommonSitesUtil.isLogin();
            
            Test.stopTest();

            System.assertEquals(result, null);
        }
    }

    /**
     * 未ログイン判定
     * システム管理者ユーザ
     */
    static testMethod void isNotLoginTest() {
        
        System.runAs(testAdminUser) {

            Test.startTest();
            
            PageReference result = CommonSitesUtil.isNotLogin();
            
            Test.stopTest();

            System.assertEquals(result.getUrl(), Page.Home.getUrl());
        }
    }

    /**
     * ユーザタイプの判定(Standard)
     * システム管理者ユーザ
     */
    static testMethod void isUserTypeStandardTest() {
        
        System.runAs(testAdminUser) {

            Test.startTest();
            
            Boolean result = CommonSitesUtil.isUserTypeStandard();
            
            Test.stopTest();

            System.assertEquals(result, true);
        }
    }
}