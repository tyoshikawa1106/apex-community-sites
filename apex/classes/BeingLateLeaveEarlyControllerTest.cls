@isTest
private class BeingLateLeaveEarlyControllerTest {

    private static User testAdminUser = new User(Id = UserInfo.getUserId());

    /**
     * コンストラクタ
     */
    static testMethod void BeingLateLeaveEarlyControllerTest() {
        
        System.runAs(testAdminUser) {

            Test.startTest();
            
            BeingLateLeaveEarlyController cls = new BeingLateLeaveEarlyController();
            cls.init();
            
            Test.stopTest();
        }
    }

    /**
     * 遅刻早退情報リストの取得
     * 値なし
     */
    static testMethod void getBeingLateLeaveEarlysTest1() {
        
        System.runAs(testAdminUser) {

            Test.startTest();
            
            List<BeingLateLeaveEarlyWrapper> results = BeingLateLeaveEarlyController.getBeingLateLeaveEarlys();
            
            Test.stopTest();
        }
    }

    /**
     * 遅刻早退情報の取得
     * 値なし
     */
    static testMethod void getBeingLateLeaveEarlyTest1() {
        
        System.runAs(testAdminUser) {

            String recordId = '';

            Test.startTest();
            
            BeingLateLeaveEarlyWrapper result = BeingLateLeaveEarlyController.getBeingLateLeaveEarly(recordId);
            System.assertEquals(String.isEmpty(result.recordId), true);
            
            Test.stopTest();
        }
    }

    /**
     * 遅刻早退情報の登録
     * 値なし
     */
    static testMethod void saveBeingLateLeaveEarlyTest1() {
        
        System.runAs(testAdminUser) {

            BeingLateLeaveEarlyWrapper wrapper = new BeingLateLeaveEarlyWrapper();

            Test.startTest();
            
            RemoteActionResult result = BeingLateLeaveEarlyController.saveBeingLateLeaveEarly(wrapper);
            
            Test.stopTest();

            System.assertEquals(String.isEmpty(result.recordId), true);
            System.assertEquals(result.errorMessages.size(), 1);
        }
    }

    /**
     * 遅刻早退情報の登録
     * 値あり
     */
    static testMethod void saveBeingLateLeaveEarlyTest2() {
        
        System.runAs(testAdminUser) {

            BeingLateLeaveEarly__c beingLateLeaveEarly = new BeingLateLeaveEarly__c(
                Date__c = System.today()
            );
            BeingLateLeaveEarlyWrapper wrapper = new BeingLateLeaveEarlyWrapper(beingLateLeaveEarly);

            Test.startTest();
            
            RemoteActionResult result = BeingLateLeaveEarlyController.saveBeingLateLeaveEarly(wrapper);
            
            Test.stopTest();

            System.assertEquals(String.isNotEmpty(result.recordId), true);
            System.assertEquals(result.errorMessages.size(), 0);
        }
    }

    /**
     * 遅刻早退情報の削除
     * 値なし
     */
    static testMethod void deleteBeingLateLeaveEarlyTest1() {
        
        System.runAs(testAdminUser) {

            String deleteId = '';

            Test.startTest();
            
            BeingLateLeaveEarlyController.deleteBeingLateLeaveEarly(deleteId);
            
            Test.stopTest();
        }
    }
}