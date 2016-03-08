public with sharing class PartnerChangePasswordHelper {

    /**
     * コンストラクタ
     */
    public PartnerChangePasswordHelper() {
        
    }

    /**
     * パスワードの入力値チェック
     */
    public String checkInputPassword(String oldpassword, String newPassword, String verifyNewPassword) {
        if (String.isEmpty(oldpassword)) {
            return '現在のパスワードを入力してください。';
        }
        
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

    /**
     * パスワード変更処理結果判定
     */
    public String checkChangePasswordResult(PageReference result) {
        if (result == null) {
            return 'パスワードの更新に失敗しました。要件を満たしているか確認してください。';
        }

        return '';
    }
}