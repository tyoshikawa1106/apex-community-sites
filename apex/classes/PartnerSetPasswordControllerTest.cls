@isTest
private class PartnerSetPasswordControllerTest {

    private static User testAdminUser = new User(Id = UserInfo.getUserId());

    /**
     * コンストラクタ
     */
    static testMethod void PartnerSetPasswordControllerTest1() {
        
        System.runAs(testAdminUser) {

            Test.startTest();
            
            PartnerSetPasswordController cls = new PartnerSetPasswordController();
            
            Test.stopTest();

            System.assertEquals(String.isEmpty(cls.newPassword), true);
            System.assertEquals(String.isEmpty(cls.verifyNewPassword), true);
            System.assertEquals(String.isEmpty(cls.errorMessage), true);
        }
    }

    /**
     * パスワードの変更
     */
    static testMethod void setPasswordTest1() {
        
        System.runAs(testAdminUser) {

            Test.startTest();
            
            PartnerSetPasswordController cls = new PartnerSetPasswordController();
            cls.newPassword = '';
            cls.verifyNewPassword = '';
            cls.errorMessage = '';
            PageReference result = cls.setPassword();
            
            Test.stopTest();

            System.assertEquals(result, null);
        }
    }

    /**
     * パスワードの変更
     */
    static testMethod void setPasswordTest2() {
        
        System.runAs(testAdminUser) {

            Test.startTest();
            
            PartnerSetPasswordController cls = new PartnerSetPasswordController();
            cls.newPassword = 'newPassword';
            cls.verifyNewPassword = cls.newPassword;
            cls.errorMessage = '';
            PageReference result = cls.setPassword();
            
            Test.stopTest();

            System.assertEquals(result.getUrl(), Page.Home.getUrl());
        }
    }
}