public with sharing class LeaveRequestController {

    private static LeaveRequestHelper helper = new LeaveRequestHelper();
    private static LeaveRequestDao dao = new LeaveRequestDao();
    
    /**
     * コンストラクタ
     */
    public LeaveRequestController() {
        
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
     * 休暇申請情報リストの取得
     */
    @RemoteAction
    public static List<LeaveRequestWrapper> getLeaveRequests() {
        // 休暇申請リスト取得
        List<LeaveRequest__c> leaveRequests = dao.getLeaveRequests();
        // リストをラッパー変数にセット
        List<LeaveRequestWrapper> wrapperList = new List<LeaveRequestWrapper>();
        for(LeaveRequest__c l : leaveRequests) {
            wrapperList.add(new LeaveRequestWrapper(l));
        }
        return wrapperList;
    }

    /**
     * 休暇申請情報の取得
     */
    @RemoteAction
    public static LeaveRequestWrapper getLeaveRequest(String recordId) {
        // 休暇申請取得
        LeaveRequest__c leaveRequest = dao.getLeaveRequest(recordId);
        // ラッパー変数にセット
        LeaveRequestWrapper wrapper = new LeaveRequestWrapper(leaveRequest);
        return wrapper;
    }

    /**
     * 休暇申請情報の登録
     */
    @RemoteAction
    public static RemoteActionResult saveLeaveRequest(LeaveRequestWrapper wrapper) {
        RemoteActionResult result = new RemoteActionResult();
        try {
            // 休暇申請レコード作成
            LeaveRequest__c leaveRequest = helper.setLeaveRequest(wrapper);
            // 登録処理実行
            upsert leaveRequest;
            result.recordId = leaveRequest.Id;
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
     * 休暇申請情報の削除
     */
    @RemoteAction
    public static void deleteLeaveRequest(String deleteId) {
        delete dao.getDeleteLeaveRequests(deleteId);
    }
}