public with sharing class WorkTimeDao {

    /**
     * コンストラクタ
     */
    public WorkTimeDao() {
        
    }

    /**
     * 勤怠情報リスト取得
     */
    public List<WorkTime__c> getWorkTimes() {
        return [
            SELECT
                 Id
                ,Date__c
                ,WorkStartTime__c
                ,WorkEndTime__c
                ,Description__c
            FROM
                WorkTime__c
            WHERE
                OwnerId =: UserInfo.getUserId()
            ORDER BY Date__c DESC
            LIMIT 200
        ];
    }

    /**
     * 勤怠情報取得
     */
    public WorkTime__c getWorkTime(String recordId) {
        List<WorkTime__c> workTimes = [
            SELECT
                 Id
                ,Date__c
                ,WorkStartTime__c
                ,WorkEndTime__c
                ,Description__c
            FROM
                WorkTime__c
            WHERE
                Id =: recordId
            AND
                OwnerId =: UserInfo.getUserId()
            LIMIT 1
        ];

        return workTimes.isEmpty() ? new WorkTime__c() : workTimes[0];
    }

    /**
     * 削除対象の勤怠情報取得
     */
    public List<WorkTime__c> getDeleteWorkTimes(String recordId) {
        return [
            SELECT
                Id
            FROM
                WorkTime__c
            WHERE
                Id =: recordId
            AND
                OwnerId =: UserInfo.getUserId()
            LIMIT 1
        ];
    }
}