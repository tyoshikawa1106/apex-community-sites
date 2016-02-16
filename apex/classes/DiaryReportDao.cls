public with sharing class DiaryReportDao {

    /**
     * コンストラクタ
     */
    public DiaryReportDao() {
        
    }

    /**
     * 日報情報リスト取得
     */
    public List<DiaryReport__c> getDiaryReports() {
        return [
            SELECT
                 Id
                ,Name
                ,Title__c
                ,Date__c
                ,Description__c
            FROM
                DiaryReport__c
            WHERE
                OwnerId =: UserInfo.getUserId()
            ORDER BY Date__c DESC
            LIMIT 200
        ];
    }

    /**
     * 日報情報取得
     */
    public DiaryReport__c getDiaryReport(String recordId) {
        List<DiaryReport__c> diaryRepoerts = [
            SELECT
                 Id
                ,Name
                ,Title__c
                ,Date__c
                ,Description__c
            FROM
                DiaryReport__c
            WHERE
                Id =: recordId
            AND
                OwnerId =: UserInfo.getUserId()
            LIMIT 1
        ];

        return diaryRepoerts.isEmpty() ? new DiaryReport__c() : diaryRepoerts[0];
    }

    /**
     * 削除対象の日報情報取得
     */
    public List<DiaryReport__c> getDeleteDiaryReports(String recordId) {
        return [
            SELECT
                Id
            FROM
                DiaryReport__c
            WHERE
                Id =: recordId
            AND
                OwnerId =: UserInfo.getUserId()
            LIMIT 1
        ];
    }
}