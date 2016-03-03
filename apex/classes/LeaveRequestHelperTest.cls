@isTest
private class LeaveRequestHelperTest {

    private static LeaveRequestHelper helper = new LeaveRequestHelper();
    private static User testAdminUser = new User(Id = UserInfo.getUserId());

    /**
     * 休暇申請情報に値をセット
     * 値なし
     */
    static testMethod void setLeaveRequestTest1() {
        
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
    static testMethod void setLeaveRequestTest2() {
        
        System.runAs(testAdminUser) {
            LeaveRequest__c leaveRequest = new LeaveRequest__c(
                 Date__c = System.today()
                ,Description__c = 'Sample'
                ,ApprovalUser__c = UserInfo.getUserId()
                ,RequestType__c = '全休'
            );
            insert leaveRequest;
            LeaveRequestWrapper wrapper = new LeaveRequestWrapper(leaveRequest);

            Test.startTest();
            
            LeaveRequest__c result = helper.setLeaveRequest(wrapper);
            
            Test.stopTest();

            System.assertEquals(String.isNotEmpty(result.Id), true);
        }
    }

    /**
     * レコードロック判定
     * 値なし
     */
    static testMethod void checkRecordLockedTest1() {
        
        System.runAs(testAdminUser) {

            LeaveRequest__c leaveRequest = new LeaveRequest__c(
                 Date__c = System.today()
                ,Description__c = 'Sample'
                ,ApprovalUser__c = UserInfo.getUserId()
            );
            insert leaveRequest;

            Test.startTest();
            
            // IDなし
            Boolean result = helper.checkRecordLocked(null);
            System.assertEquals(result, false);

            // IDあり(レコードロックなし)
            result = helper.checkRecordLocked(leaveRequest.Id);
            System.assertEquals(result, false);
            
            Test.stopTest();
        }
    }

    /**
     * レコードロック判定
     * 値あり
     */
    static testMethod void checkRecordLockedTest2() {
        
        System.runAs(testAdminUser) {

            LeaveRequest__c leaveRequest = new LeaveRequest__c(
                 Date__c = System.today()
                ,Description__c = 'Sample'
                ,ApprovalUser__c = UserInfo.getUserId()
            );
            insert leaveRequest;
            // レコードロック
            Approval.LockResult lockResult = Approval.lock(leaveRequest, false);

            Test.startTest();
            
            Boolean result = helper.checkRecordLocked(leaveRequest.Id);
            System.assertEquals(result, true);
            
            Test.stopTest();
        }
    }

    /**
     * ユーザID取得
     * 値なし
     */
    static testMethod void getActorIdsTest1() {
        
        System.runAs(testAdminUser) {

            List<ProcessInstance> processInstances = new List<ProcessInstance>();

            Test.startTest();
            
            Set<Id> results = helper.getActorIds(processInstances);
            
            Test.stopTest();

            System.assertEquals(results.size(), 0);
        }
    }

    /**
     * 戻り値リスト取得
     * 値なし
     */
    static testMethod void getLeaveRequestProcessInstanceInfoListTest1() {
        
        System.runAs(testAdminUser) {

            List<ProcessInstance> processInstances = new List<ProcessInstance>();
            Map<Id, User> userMap = new Map<Id, User>();

            Test.startTest();
            
            List<LeaveRequestProcessInstanceInfo> results = helper.getLeaveRequestProcessInstanceInfoList(processInstances, userMap);
            
            Test.stopTest();

            System.assertEquals(results.size(), 0);
        }
    }
}