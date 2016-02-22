public with sharing class BeingLateLeaveEarlyDao {

    /**
     * コンストラクタ
     */
    public BeingLateLeaveEarlyDao() {
        
    }

    /**
     * 遅刻早退情報リスト取得
     */
    public List<BeingLateLeaveEarly__c> getBeingLateLeaveEarlys() {
        return [
            SELECT
                 Id
                ,Date__c
                ,Description__c
            FROM
                BeingLateLeaveEarly__c
            WHERE
                OwnerId =: UserInfo.getUserId()
            ORDER BY Date__c DESC
            LIMIT 200
        ];
    }

    /**
     * 遅刻早退情報取得
     */
    public BeingLateLeaveEarly__c getBeingLateLeaveEarly(String recordId) {
        List<BeingLateLeaveEarly__c> beingLateLeaveEarlys = [
            SELECT
                 Id
                ,Date__c
                ,Description__c
            FROM
                BeingLateLeaveEarly__c
            WHERE
                Id =: recordId
            AND
                OwnerId =: UserInfo.getUserId()
            LIMIT 1
        ];

        return beingLateLeaveEarlys.isEmpty() ? new BeingLateLeaveEarly__c() : beingLateLeaveEarlys[0];
    }

    /**
     * 削除対象の遅刻早退情報取得
     */
    public List<BeingLateLeaveEarly__c> getDeleteBeingLateLeaveEarlys(String recordId) {
        return [
            SELECT
                Id
            FROM
                BeingLateLeaveEarly__c
            WHERE
                Id =: recordId
            AND
                OwnerId =: UserInfo.getUserId()
            LIMIT 1
        ];
    }
}