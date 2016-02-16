public with sharing class BeingLateLeaveEarlyController {
    
    /**
     * コンストラクタ
     */
    public BeingLateLeaveEarlyController() {
        
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