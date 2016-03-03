@isTest
private class LeaveRequestWrapperTest {

    private static User testAdminUser = new User(Id = UserInfo.getUserId());

    /**
     * コンストラクタ
     */
    static testMethod void LeaveRequestWrapperTest1() {
        
        System.runAs(testAdminUser) {

            Test.startTest();
            
            LeaveRequestWrapper cls = new LeaveRequestWrapper();
            
            Test.stopTest();

            System.assertEquals(String.isEmpty(cls.recordId), true);
        }
    }

    /**
     * コンストラクタ
     */
    static testMethod void LeaveRequestWrapperTest2() {
        
        System.runAs(testAdminUser) {

            LeaveRequest__c leaveRequest = new LeaveRequest__c(
                 Date__c = System.today()
                ,ApprovalUser__c = UserInfo.getUserId()
            );
            insert leaveRequest;

            Test.startTest();
            
            LeaveRequestWrapper cls = new LeaveRequestWrapper(leaveRequest);
            
            Test.stopTest();

            System.assertEquals(String.isNotEmpty(cls.recordId), true);
        }
    }
}