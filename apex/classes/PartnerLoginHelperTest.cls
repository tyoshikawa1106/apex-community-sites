@isTest
private class PartnerLoginHelperTest {

    private static PartnerLoginHelper helper = new PartnerLoginHelper();
    private static User testAdminUser = new User(Id = UserInfo.getUserId());

    /**
     * ユーザIDとパスワードの入力チェック
     */
    static testMethod void checkUserIdAndPasswordTest() {
        
        System.runAs(testAdminUser) {

            Test.startTest();
            
            // 値あり
            String errorMsg = helper.checkUserIdAndPassword('ID', 'Password');
            System.assertEquals(String.isEmpty(errorMsg), true);
            // ユーザIDのみ
            errorMsg = helper.checkUserIdAndPassword('ID', '');
            System.assertEquals(String.isNotEmpty(errorMsg), true);
            // パスワードのみ
            errorMsg = helper.checkUserIdAndPassword('', 'Password');
            System.assertEquals(String.isNotEmpty(errorMsg), true);
            
            Test.stopTest();
        }
    }

    /**
     * 開始URL取得判定
     * URLパラメータなし
     */
    static testMethod void getStartUrlTest1() {
        
        System.runAs(testAdminUser) {

            Test.startTest();
            
            String result = helper.getStartUrl();
            System.assertEquals(result, Page.Home.getUrl());
            
            Test.stopTest();
        }
    }

    /**
     * 開始URL取得判定
     * URLパラメータあり
     */
    static testMethod void getStartUrlTest2() {
        
        System.runAs(testAdminUser) {

            // Set URL Parameter
            PageReference pageRef = new PageReference('TestPageURL');
            pageRef.getParameters().put('startURL', Page.DiaryReport.getUrl());
            // Set CurrentPage
            Test.setCurrentPage(pageRef);

            Test.startTest();
            
            String result = helper.getStartUrl();
            System.assertEquals(result, Page.DiaryReport.getUrl());
            
            Test.stopTest();
        }
    }
}