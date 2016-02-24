public with sharing class HomeDao {

    /**
     * コンストラクタ
     */
    public HomeDao() {
        
    }

    /**
     * ログインユーザ情報取得
     */
    public User getLoginUser() {
        return [
            SELECT
                 Id
                ,Name
                ,SmallPhotoUrl
                ,LanguageLocaleKey
                ,TimeZoneSidKey
            FROM
                User
            WHERE
                Id =: UserInfo.getUserId()
            LIMIT 1
        ];
    }
}