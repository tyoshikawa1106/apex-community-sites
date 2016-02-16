public with sharing class PartnerLoginHelper {

    /**
     * コンストラクタ
     */
    public PartnerLoginHelper() {
        
    }

    /**
     * ユーザIDとパスワードの入力チェック
     */
    public String checkUserIdAndPassword(String userId, String password) {
        String errorMsg = '';
        if (String.isEmpty(userId) || String.isEmpty(password)) {
            errorMsg = 'ユーザ名 または パスワードが未入力です';
        }
        return errorMsg;
    }

    /**
     * 開始URL取得判定
     */
    public String getStartUrl() {
        String startUrl = System.currentPageReference().getParameters().get('startURL');
        if (String.isEmpty(startUrl)) {
            startUrl = Page.Home.getUrl();
        }
        return startUrl;
    }
}