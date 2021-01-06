public class DeleteRejectedComplaints implements Database.Batchable<SObject>{
	 public Database.QueryLocator start(Database.BatchableContext bc){
        String query = 'Select id from Complaint__c WHERE Status__c = \'Cancelled\' AND CreatedDate = LAST_YEAR';
        system.debug(Database.getQueryLocator(query));
        return Database.getQueryLocator(query);
    }
    
    public void execute(Database.BatchableContext bc, List<Complaint__c> scope){
        system.debug(scope);
        delete scope;
    }
    
    public void finish(Database.BatchableContext bc){
        System.debug('Finished...');
    }
}