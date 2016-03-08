@isTest
private class PartnerChangePasswordHelperTest {

    private static PartnerChangePasswordHelper helper = new PartnerChangePasswordHelper();
    private static User testAdminUser = new User(Id = UserInfo.getUserId());

    /**
     * パスワードの入力値チェック
     */
    static testMethod void checkInputPasswordTest1() {
        
        System.runAs(testAdminUser) {

            Test.startTest();
            
            // 現在のパスワード未入力
            String oldpassword = '';
            String newPassword = '';
            String verifyNewPassword = '';
            String result = helper.checkInputPassword(oldpassword, newPassword, verifyNewPassword);
            System.assertEquals(String.isNotEmpty(result), true);

            // 新しいパスワード未入力
            oldpassword = 'olePassword';
            newPassword = '';
            verifyNewPassword = '';
            result = helper.checkInputPassword(oldpassword, newPassword, verifyNewPassword);
            System.assertEquals(String.isNotEmpty(result), true);

            // 新しいパスワード(確認)未入力
            oldpassword = 'olePassword';
            newPassword = 'newPassword';
            verifyNewPassword = '';
            result = helper.checkInputPassword(oldpassword, newPassword, verifyNewPassword);
            System.assertEquals(String.isNotEmpty(result), true);

            // パスワード不一致未入力
            oldpassword = 'olePassword';
            newPassword = 'newPassword';
            verifyNewPassword = 'verifyNewPassword';
            result = helper.checkInputPassword(oldpassword, newPassword, verifyNewPassword);
            System.assertEquals(String.isNotEmpty(result), true);

            // 正常
            oldpassword = 'olePassword';
            newPassword = 'newPassword';
            verifyNewPassword = newPassword;
            result = helper.checkInputPassword(oldpassword, newPassword, verifyNewPassword);
            System.assertEquals(String.isEmpty(result), true);
            
            Test.stopTest();
        }
    }

    /**
     * パスワード変更処理結果判定
     */
    static testMethod void checkChangePasswordResultTest1() {
        
        System.runAs(testAdminUser) {

            Test.startTest();

            // 正常系
            PageReference resultUrl = new PageReference('OK');
            String resultMsg = helper.checkChangePasswordResult(resultUrl);
            System.assertEquals(String.isEmpty(resultMsg), true);

            // 異常系
            resultUrl = null;
            resultMsg = helper.checkChangePasswordResult(resultUrl);
            System.assertEquals(String.isNotEmpty(resultMsg), true);

            Test.stopTest();
        }
    }
}