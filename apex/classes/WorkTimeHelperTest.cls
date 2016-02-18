@isTest
private class WorkTimeHelperTest {

    private static WorkTimeHelper helper = new WorkTimeHelper();
    private static User testAdminUser = new User(Id = UserInfo.getUserId());

    /**
     * 勤怠情報に値をセット
     * 値なし
     */
    static testMethod void WorkTimeHelperTest1() {
        
        System.runAs(testAdminUser) {

            WorkTimeWrapper wrapper = new WorkTimeWrapper();

            Test.startTest();
            
            WorkTime__c result = helper.setWorkTime(wrapper);
            
            Test.stopTest();

            System.assertEquals(String.isEmpty(result.Id), true);
        }
    }

    /**
     * 勤怠情報に値をセット
     * 値あり
     */
    static testMethod void WorkTimeHelperTest2() {
        
        System.runAs(testAdminUser) {
            WorkTime__c workTime = new WorkTime__c(
                 Date__c = System.today()
                ,Description__c = 'Sample'
            );
            insert workTime;
            WorkTimeWrapper wrapper = new WorkTimeWrapper(workTime);

            Test.startTest();
            
            WorkTime__c result = helper.setWorkTime(wrapper);
            
            Test.stopTest();

            System.assertEquals(String.isNotEmpty(result.Id), true);
        }
    }
}