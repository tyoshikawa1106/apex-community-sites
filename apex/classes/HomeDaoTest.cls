@isTest
private class HomeDaoTest {

    private static HomeDao dao = new HomeDao();
    private static User testAdminUser = new User(Id = UserInfo.getUserId());

    /**
     * ログインユーザ情報取得
     */
    static testMethod void getLoginUserTest1() {
        
        System.runAs(testAdminUser) {

            Test.startTest();
            
            User result = dao.getLoginUser();
            
            Test.stopTest();

            System.assertEquals(String.isNotEmpty(result.Id), true);
        }
    }
}