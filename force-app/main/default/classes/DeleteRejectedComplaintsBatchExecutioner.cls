public class DeleteRejectedComplaintsBatchExecutioner {
    public ID executeBatchProcess(){
        ID batchprocessid = Database.executeBatch(new DeleteRejectedComplaints(),20);
        return batchprocessid;
    }
    
    public string getBatchStatus(ID batchprocessid){
        AsyncApexJob aaj = [SELECT Id, Status, JobItemsProcessed, TotalJobItems, NumberOfErrors 
                    FROM AsyncApexJob WHERE ID =: batchprocessid ];
        return (String)aaj.Status;
    }
}