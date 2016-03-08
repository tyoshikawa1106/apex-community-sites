public with sharing class PartnerForgotPasswordController {

    public String userId {get; set;}
    public String errorMessage {get; set;}

    /**
     * コンストラクタ
     */
    public PartnerForgotPasswordController() {
        this.userId = '';
        this.errorMessage = '';
    }

    /**
     * パスワードリセット
     */
    public PageReference resetPassword() {
        try {
            // ユーザ名入力
            if (String.isEmpty(this.userId)) {
                this.errorMessage = 'ユーザ名を入力してください';
                return null;
            }
            // パスワードリセット
            Site.forgotPassword(this.userId);
        } catch(Exception e) {
            this.errorMessage = e.getMessage();
        }

        return Page.PartnerForgotPasswordResult;
    }
}