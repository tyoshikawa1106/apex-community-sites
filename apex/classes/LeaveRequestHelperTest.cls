@isTest
private class LeaveRequestHelperTest {

    private static LeaveRequestHelper helper = new LeaveRequestHelper();
    private static User testAdminUser = new User(Id = UserInfo.getUserId());

    /**
     * 休暇申請情報に値をセット
     * 値なし
     */
    static testMethod void LeaveRequestHelperTest1() {
        
        System.runAs(testAdminUser) {

            LeaveRequestWrapper wrapper = new LeaveRequestWrapper();

            Test.startTest();
            
            LeaveRequest__c result = helper.setLeaveRequest(wrapper);
            
            Test.stopTest();

            System.assertEquals(String.isEmpty(result.Id), true);
        }
    }

    /**
     * 休暇申請情報に値をセット
     * 値あり
     */
    static testMethod void LeaveRequestHelperTest2() {
        
        System.runAs(testAdminUser) {
            LeaveRequest__c leaveRequest = new LeaveRequest__c(
                 Date__c = System.today()
                ,Description__c = 'Sample'
            );
            insert leaveRequest;
            LeaveRequestWrapper wrapper = new LeaveRequestWrapper(leaveRequest);

            Test.startTest();
            
            LeaveRequest__c result = helper.setLeaveRequest(wrapper);
            
            Test.stopTest();

            System.assertEquals(String.isNotEmpty(result.Id), true);
        }
    }
}