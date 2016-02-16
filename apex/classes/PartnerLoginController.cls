public with sharing class PartnerLoginController {

    private PartnerLoginHelper helper = new PartnerLoginHelper();

    public String userId {get; set;}
    public String password {get; set;}
    public String errorMessage {get; set;}

    /**
     * コンストラクタ
     */
    public PartnerLoginController() {
        this.userId = '';
        this.password = '';
        this.errorMessage = '';
    }

    /**
     * 初期処理
     */
    public PageReference init() {
        // 未ログイン判定
        PageReference startUrl = CommonSitesUtil.isNotLogin();
        if (startUrl != null) return startUrl;

        return null;
    }

    /**
     * ログイン
     */
    public PageReference doLogin() {
        PageReference result = null;
        try {
            // ユーザIDとパスワードの入力チェック
            this.errorMessage = helper.checkUserIdAndPassword(this.userId, this.password);
            if (String.isNotEmpty(this.errorMessage)) return null;

            // 開始URL取得判定
            String startUrl = helper.getStartUrl();
            
            // サイトログイン
            result = Site.login(this.userId, this.password, startUrl);
            if (result == null) {
                this.errorMessage = 'ログインに失敗しました。';
            }
        } catch(Exception e) {
            this.errorMessage = e.getMessage();
            return null;
        }
        
        return result;
    }
}