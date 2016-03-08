public with sharing class PartnerSetPasswordController {

    private PartnerSetPasswordHelper helper = new PartnerSetPasswordHelper();

    public String newPassword {get; set;}
    public String verifyNewPassword {get; set;}
    public String errorMessage {get; set;}

    /**
     * コンストラクタ
     */
    public PartnerSetPasswordController() {
        this.newPassword = '';
        this.verifyNewPassword = '';
        this.errorMessage = '';
    }

    /**
     * パスワードの変更
     */
    public PageReference setPassword() {

        PageReference result = null;

        try {
            // パスワード入力値チェック
            this.errorMessage = this.helper.checkInputPassword(this.newPassword, this.verifyNewPassword);
            if (String.isNotEmpty(this.errorMessage)) return null;

            // パスワード変更
            if (!Test.isRunningTest()) {
                try {
                    System.setPassword(UserInfo.getUserId(), this.newPassword);
                } catch(Exception e) {
                    this.errorMessage = 'パスワードの更新に失敗しました。要件を満たしているか確認してください。';
                    return null;
                }
            }

        } catch(Exception e) {
            this.errorMessage = e.getMessage();
            return null;
        }

        return Page.Home;
    }
}