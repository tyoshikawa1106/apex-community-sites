public with sharing class LeaveRequestController {

    private static LeaveRequestHelper helper = new LeaveRequestHelper();
    private static LeaveRequestDao dao = new LeaveRequestDao();
    
    /**
     * コンストラクタ
     */
    public LeaveRequestController() {
        System.debug(UserInfo.getUserType());
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
            // レコードロック判定
            if (helper.checkRecordLocked(leaveRequest.Id)) {
                result.errorMessages.add('レコードがロックされています。このレコードは承認申請済みです。');
                return result;
            }
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

    /**
     * 承認担当ユーザの検索(ルックアップフィールド用)
     */
    @RemoteAction
    public static List<User> getApprovalUsers(String userName) {
        return dao.getApprovalUsers(userName);
    }

    /**
     * 承認履歴の情報取得
     */
    @RemoteAction
    public static List<LeaveRequestProcessInstanceInfo> getProcessInstanceInfo(String recordId) {
        // 一般ユーザ以外の場合は取得不可
        if (!CommonSitesUtil.isUserTypeStandard()) {
            return new List<LeaveRequestProcessInstanceInfo>();
        }
        // processInstance取得
        List<ProcessInstance> processInstances = dao.getProcessInstances(recordId);
        // ユーザID情報取得
        Set<Id> userIds = helper.getActorIds(processInstances);
        // ユーザ情報取得
        List<User> users = dao.getActorUsers(userIds);
        // ユーザマップ取得
        Map<Id, User> userMap = new Map<Id, User>(users);
        // 戻り値にセット
        List<LeaveRequestProcessInstanceInfo> results = helper.getLeaveRequestProcessInstanceInfoList(processInstances, userMap);

        return results;
    }

    /**
     * 休暇申請情報の承認申請
     */
    @RemoteAction
    public static RemoteActionResult requestApprovalByApex(String recordId, String nextApproverId) {
        RemoteActionResult result = new RemoteActionResult();
        try {
            // レコードID存在判定
            if (String.isEmpty(recordId)) {
                result.errorMessages.add('レコードIDの取得に失敗しました');
                return result;
            }

            // レコードロック判定
            if (helper.checkRecordLocked(recordId)) {
                result.errorMessages.add('レコードがロックされています。このレコードは承認申請済みです。');
                return result;
            }

            // 割り当てユーザ
            List<Id> nextUserIds = new List<Id>();
            if (String.isNotEmpty(nextApproverId)) {
                nextUserIds.add(nextApproverId);
            }

            // 承認申請テストデータ
            Approval.ProcessSubmitRequest psr = new Approval.ProcessSubmitRequest();
            psr.setObjectId(recordId);
            psr.setNextApproverIds(nextUserIds);
            Approval.ProcessResult submitResult = Approval.process(psr);
            System.assert(submitResult.isSuccess());
            
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