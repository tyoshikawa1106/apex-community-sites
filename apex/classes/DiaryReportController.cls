public with sharing class DiaryReportController {

    private static DiaryReportDao dao = new DiaryReportDao();

    /**
     * コンストラクタ
     */
    public DiaryReportController() {
        
    }

    /**
     * 初期処理
     */
    public PageReference init() {
        // ログイン済み判定
        PageReference startUrl = CommonSitesUtil.isLogin();
        if (startUrl != null) return startUrl;

        return null;
    }

    /**
     * 日報情報リストの取得
     */
    @RemoteAction
    public static List<DiaryReport__c> getDiaryReports() {
        return dao.getDiaryReports();
    }

    /**
     * 日報情報の取得
     */
    @RemoteAction
    public static DiaryReport__c getDiaryReport(String recordId) {
        return dao.getDiaryReport(recordId);
    }

    /**
     * 日報情報の登録
     */
    @RemoteAction
    public static RemoteActionResult saveDiaryReport(DiaryReport__c diaryReport) {
        RemoteActionResult result = new RemoteActionResult();

        try {
            upsert diaryReport;
            result.recordId = diaryReport.Id;
        } catch(DmlException e) {
            result.errorMessages.add(e.getDmlMessage(0));
            return result;
        } catch(Exception e) {
            result.errorMessages.add(e.getMessage());
            return result;
        }
        
        return result;
    }

    /**
     * 日報情報の削除
     */
    @RemoteAction
    public static RemoteActionResult deleteDiaryReport(String deleteId) {
        RemoteActionResult result = new RemoteActionResult();
        
        try {
            delete dao.getDeleteDiaryReports(deleteId);
        } catch(DmlException e) {
            result.errorMessages.add(e.getDmlMessage(0));
            return result;
        } catch(Exception e) {
            result.errorMessages.add(e.getMessage());
            return result;
        }
        
        return result;
    }
}