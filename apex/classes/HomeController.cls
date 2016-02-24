public with sharing class HomeController {

    private static HomeDao dao = new HomeDao();

    /**
     * コンストラクタ
     */
    public HomeController() {
        
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

    /**
     * ユーザ情報の取得
     */
    @RemoteAction
    public static User getLoginUser() {
        return dao.getLoginUser();
    }
}