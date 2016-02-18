public with sharing class WorkTimeController {

    private static WorkTimeHelper helper = new WorkTimeHelper();
    private static WorkTimeDao dao = new WorkTimeDao();
    
    /**
     * コンストラクタ
     */
    public WorkTimeController() {
        
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
     * 勤怠情報リストの取得
     */
    @RemoteAction
    public static List<WorkTimeWrapper> getWorkTimes() {
        // 勤怠リスト取得
        List<WorkTime__c> workTimes = dao.getWorkTimes();
        // リストをラッパー変数にセット
        List<WorkTimeWrapper> wrapperList = new List<WorkTimeWrapper>();
        for(WorkTime__c w : workTimes) {
            wrapperList.add(new WorkTimeWrapper(w));
        }
        return wrapperList;
    }

    /**
     * 勤怠情報の取得
     */
    @RemoteAction
    public static WorkTimeWrapper getWorkTime(String recordId) {
        // 勤怠取得
        WorkTime__c workTime = dao.getWorkTime(recordId);
        // ラッパー変数にセット
        WorkTimeWrapper wrapper = new WorkTimeWrapper(workTime);
        return wrapper;
    }

    /**
     * 勤怠情報の登録
     */
    @RemoteAction
    public static RemoteActionResult saveWorkTime(WorkTimeWrapper wrapper) {
        RemoteActionResult result = new RemoteActionResult();
        try {
            // 勤怠レコード作成
            WorkTime__c workTime = helper.setWorkTime(wrapper);
            // 登録処理実行
            upsert workTime;
            result.recordId = workTime.Id;
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
     * 勤怠情報の削除
     */
    @RemoteAction
    public static void deleteWorkTime(String deleteId) {
        delete dao.getDeleteWorkTimes(deleteId);
    }
}