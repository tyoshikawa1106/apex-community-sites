public with sharing class CommonSitesUtil {

    /**
     * ログイン判定
     */
    public static PageReference isLogin() {
        String userType = UserInfo.getUserType();
        return userType.equals('Guest') ? Page.PartnerLogin : null;
    }

    /**
     * 未ログイン判定
     */
    public static PageReference isNotLogin() {
        String userType = UserInfo.getUserType();
        return userType.equals('Guest') ? null : Page.Home;
    }

    /**
     * ユーザタイプの判定(Standard)
     */
    public static Boolean isUserTypeStandard() {
        String userType = UserInfo.getUserType();
        return userType.equals('Standard') ? true : false;
    }
}