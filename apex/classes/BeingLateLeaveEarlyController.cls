public with sharing class BeingLateLeaveEarlyController {

    private static BeingLateLeaveEarlyHelper helper = new BeingLateLeaveEarlyHelper();
    private static BeingLateLeaveEarlyDao dao = new BeingLateLeaveEarlyDao();
    
    /**
     * コンストラクタ
     */
    public BeingLateLeaveEarlyController() {
        
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
    public static List<BeingLateLeaveEarlyWrapper> getBeingLateLeaveEarlys() {
        // 勤怠リスト取得
        List<BeingLateLeaveEarly__c> beingLateLeaveEarlys = dao.getBeingLateLeaveEarlys();
        // リストをラッパー変数にセット
        List<BeingLateLeaveEarlyWrapper> wrapperList = new List<BeingLateLeaveEarlyWrapper>();
        for(BeingLateLeaveEarly__c b : beingLateLeaveEarlys) {
            wrapperList.add(new BeingLateLeaveEarlyWrapper(b));
        }
        return wrapperList;
    }

    /**
     * 勤怠情報の取得
     */
    @RemoteAction
    public static BeingLateLeaveEarlyWrapper getBeingLateLeaveEarly(String recordId) {
        // 勤怠取得
        BeingLateLeaveEarly__c beingLateLeaveEarly = dao.getBeingLateLeaveEarly(recordId);
        // ラッパー変数にセット
        BeingLateLeaveEarlyWrapper wrapper = new BeingLateLeaveEarlyWrapper(beingLateLeaveEarly);
        return wrapper;
    }

    /**
     * 勤怠情報の登録
     */
    @RemoteAction
    public static RemoteActionResult saveBeingLateLeaveEarly(BeingLateLeaveEarlyWrapper wrapper) {
        RemoteActionResult result = new RemoteActionResult();
        try {
            // 勤怠レコード作成
            BeingLateLeaveEarly__c beingLateLeaveEarly = helper.setBeingLateLeaveEarly(wrapper);
            // 登録処理実行
            upsert beingLateLeaveEarly;
            result.recordId = beingLateLeaveEarly.Id;
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
    public static void deleteBeingLateLeaveEarly(String deleteId) {
        delete dao.getDeleteBeingLateLeaveEarlys(deleteId);
    }
}