public with sharing class PartnerSetPasswordHelper {

    /**
     * コンストラクタ
     */
    public PartnerSetPasswordHelper() {
        
    }

    /**
     * パスワードの入力値チェック
     */
    public String checkInputPassword(String newPassword, String verifyNewPassword) {
        
        if (String.isEmpty(newPassword)) {
            return '新しいパスワードを入力してください。';
        }

        if (String.isEmpty(verifyNewPassword)) {
            return '新しいパスワード(確認)を入力してください。';
        }

        if (!newPassword.equals(verifyNewPassword)) {
            return 'パスワードが一致しません';
        }

        return '';
    }
}