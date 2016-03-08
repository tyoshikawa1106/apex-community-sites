@isTest
private class PartnerChangePasswordControllerTest {

    private static User testAdminUser = new User(Id = UserInfo.getUserId());

    /**
     * コンストラクタ
     */
    static testMethod void PartnerChangePasswordControllerTest1() {
        
        System.runAs(testAdminUser) {

            Test.startTest();
            
            PartnerChangePasswordController cls = new PartnerChangePasswordController();
            
            Test.stopTest();

            System.assertEquals(String.isEmpty(cls.oldPassword), true);
            System.assertEquals(String.isEmpty(cls.newPassword), true);
            System.assertEquals(String.isEmpty(cls.verifyNewPassword), true);
            System.assertEquals(String.isEmpty(cls.errorMessage), true);
        }
    }

    /**
     * パスワードの変更
     * 変更処理失敗
     */
    static testMethod void changePasswordTest1() {
        
        System.runAs(testAdminUser) {

            PartnerChangePasswordController cls = new PartnerChangePasswordController();
            cls.oldPassword = '';
            cls.newPassword = '';
            cls.verifyNewPassword = '';
            cls.errorMessage = '';

            Test.startTest();
            
            PageReference result = cls.changePassword();
            
            Test.stopTest();

            System.assertEquals(result, null);
        }
    }

    /**
     * パスワードの変更
     * 変更処理成功
     */
    static testMethod void changePasswordTest2() {
        
        System.runAs(testAdminUser) {

            PartnerChangePasswordController cls = new PartnerChangePasswordController();
            cls.oldPassword = 'oldPassword';
            cls.newPassword = 'newPassword';
            cls.verifyNewPassword = 'newPassword';
            cls.errorMessage = '';

            Test.startTest();
            
            PageReference result = cls.changePassword();
            
            Test.stopTest();

            System.assertEquals(result, null);
        }
    }
}