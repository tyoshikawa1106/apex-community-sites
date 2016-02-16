public with sharing class LeaveRequestController {

    /**
     * コンストラクタ
     */
    public LeaveRequestController() {
        
    }

    /**
     * 初期処理
     */
    public PageReference init() {
        // ログイン済み判定
        PageReference startUrl = CommonSitesUtil.isLogin();
        if (startUrl != null) return startUrl;

        return null;
    }
}