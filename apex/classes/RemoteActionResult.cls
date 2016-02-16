public with sharing class RemoteActionResult {

    public Id recordId {get; set;}
    public List<String> errorMessages {get; set;}

    /**
     * コンストラクタ
     */
    public RemoteActionResult() {
        this.recordId = null;
        this.errorMessages = new List<String>();
    }
}