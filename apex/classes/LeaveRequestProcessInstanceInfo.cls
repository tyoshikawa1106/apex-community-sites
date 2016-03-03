public with sharing class LeaveRequestProcessInstanceInfo {

    public ProcessInstance processInstance {get; set;}
    public List<LeaveRequestProcessInstanceInfoDetail> processInstanceDetails {get; set;}

    /**
     * コンストラクタ
     */
    public LeaveRequestProcessInstanceInfo() {
        this.processInstance = new ProcessInstance();
        this.processInstanceDetails = new List<LeaveRequestProcessInstanceInfoDetail>();
    }

    /**
     * コンストラクタ
     */
    public LeaveRequestProcessInstanceInfo(ProcessInstance processInstance, Map<Id, User> userMap) {
        this.processInstance = processInstance;
        this.processInstanceDetails = this.getLeaveRequestProcessInstanceInfoDetail(processInstance, userMap);
    }

    /**
     * ProcessInstance詳細情報取得
     */
    private List<LeaveRequestProcessInstanceInfoDetail> getLeaveRequestProcessInstanceInfoDetail(ProcessInstance processInstance, Map<Id, User> userMap) {
        List<LeaveRequestProcessInstanceInfoDetail> processInstanceDetails = new List<LeaveRequestProcessInstanceInfoDetail>();
        
        for (ProcessInstanceHistory history : processInstance.StepsAndWorkitems) {
            LeaveRequestProcessInstanceInfoDetail detail = new LeaveRequestProcessInstanceInfoDetail();
            // 日付
            detail.completedDate = history.CreatedDate;
            // 状況
            detail.stepStatus = history.StepStatus;
            // 割当先
            if (userMap.containsKey(history.OriginalActorId)) {
                detail.originalActorUser = userMap.get(history.OriginalActorId).Name;
            }
            // 承認者
            if (userMap.containsKey(history.ActorId)) {
                detail.actorUser = userMap.get(history.ActorId).Name;
            }
            // 状況
            detail.comment = history.Comments;
            // リストに追加
            processInstanceDetails.add(detail);
        }

        return processInstanceDetails;
    }

    /**
     * ProcessInstance詳細情報
     */
    public class LeaveRequestProcessInstanceInfoDetail {
        // 日付
        public DateTime completedDate {get; set;}
        // 状況
        public String stepStatus {get; set;}
        // 割当先
        public String originalActorUser {get; set;}
        // 承認者
        public String actorUser {get; set;}
        // コメント
        public String comment {get; set;}

        /**
         * コンストラクタ
         */
        public LeaveRequestProcessInstanceInfoDetail() {
            this.completedDate = null;
            this.stepStatus = '';
            this.originalActorUser = '';
            this.actorUser = '';
            this.comment = '';
        }
    }
}