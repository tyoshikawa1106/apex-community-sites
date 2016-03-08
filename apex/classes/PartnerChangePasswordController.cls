public with sharing class PartnerChangePasswordController {

    private PartnerChangePasswordHelper helper = new PartnerChangePasswordHelper();

    public String oldPassword {get; set;}
    public String newPassword {get; set;}
    public String verifyNewPassword {get; set;}
    public String errorMessage {get; set;}

    /**
     * コンストラクタ
     */
    public PartnerChangePasswordController() {
        this.oldPassword = '';
        this.newPassword = '';
        this.verifyNewPassword = '';
        this.errorMessage = '';
    }

    /**
     * パスワードの変更
     */
    public PageReference changePassword() {

        PageReference result = null;

        try {
            // パスワード入力値チェック
            this.errorMessage = this.helper.checkInputPassword(this.oldpassword, this.newPassword, this.verifyNewPassword);
            if (String.isNotEmpty(this.errorMessage)) return null;

            // パスワード変更
            result = Site.changePassword(this.newPassword, this.verifyNewPassword, this.oldpassword);
            // パスワード変更結果確認(Apexテストでは変更不可のため判定スキップ)
            this.errorMessage = this.helper.checkChangePasswordResult(result);
            if (String.isNotEmpty(this.errorMessage) && !Test.isRunningTest()) return null;

        } catch(Exception e) {
            this.errorMessage = e.getMessage();
            return null;
        }

        return result;
    }
}