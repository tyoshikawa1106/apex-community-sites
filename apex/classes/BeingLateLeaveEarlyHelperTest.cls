@isTest
private class BeingLateLeaveEarlyHelperTest {

    private static BeingLateLeaveEarlyHelper helper = new BeingLateLeaveEarlyHelper();
    private static User testAdminUser = new User(Id = UserInfo.getUserId());

    /**
     * 遅刻早退情報に値をセット
     * 値なし
     */
    static testMethod void BeingLateLeaveEarlyHelperTest1() {
        
        System.runAs(testAdminUser) {

            BeingLateLeaveEarlyWrapper wrapper = new BeingLateLeaveEarlyWrapper();

            Test.startTest();
            
            BeingLateLeaveEarly__c result = helper.setBeingLateLeaveEarly(wrapper);
            
            Test.stopTest();

            System.assertEquals(String.isEmpty(result.Id), true);
        }
    }

    /**
     * 遅刻早退情報に値をセット
     * 値あり
     */
    static testMethod void BeingLateLeaveEarlyHelperTest2() {
        
        System.runAs(testAdminUser) {
            BeingLateLeaveEarly__c beingLateLeaveEarly = new BeingLateLeaveEarly__c(
                 Date__c = System.today()
                ,Description__c = 'Sample'
            );
            insert beingLateLeaveEarly;
            BeingLateLeaveEarlyWrapper wrapper = new BeingLateLeaveEarlyWrapper(beingLateLeaveEarly);

            Test.startTest();
            
            BeingLateLeaveEarly__c result = helper.setBeingLateLeaveEarly(wrapper);
            
            Test.stopTest();

            System.assertEquals(String.isNotEmpty(result.Id), true);
        }
    }
}