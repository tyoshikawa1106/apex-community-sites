@isTest
private class PartnerForgotPasswordControllerTest {

    private static User testAdminUser = new User(Id = UserInfo.getUserId());

    /**
     * コンストラクタ
     */
    static testMethod void PartnerForgotPasswordControllerTest() {
        
        System.runAs(testAdminUser) {

            Test.startTest();
            
            PartnerForgotPasswordController cls = new PartnerForgotPasswordController();
            
            Test.stopTest();

            System.assertEquals(String.isEmpty(cls.userId), true);
            System.assertEquals(String.isEmpty(cls.errorMessage), true);
        }
    }

    /**
     * パスワードリセット
     */
    static testMethod void doPasswordResetTest1() {
        
        System.runAs(testAdminUser) {

            Test.startTest();
            
            PartnerForgotPasswordController cls = new PartnerForgotPasswordController();
            cls.userId = 'salesforcedevjp@example.com';
            PageReference result = cls.doPasswordReset();
            
            Test.stopTest();

            System.assertEquals(String.isEmpty(cls.errorMessage), true);
            System.assertEquals(result.getUrl(), Page.PartnerForgotPasswordResult.getUrl());
        }
    }

    /**
     * パスワードリセット
     */
    static testMethod void doPasswordResetTest2() {
        
        System.runAs(testAdminUser) {

            Test.startTest();
            
            PartnerForgotPasswordController cls = new PartnerForgotPasswordController();
            cls.userId = '';
            PageReference result = cls.doPasswordReset();
            
            Test.stopTest();

            System.assertEquals(String.isNotEmpty(cls.errorMessage), true);
            System.assertEquals(result, null);
        }
    }
}