trigger DeleteRelatedComplaints on Customer__c (before delete) {
	List<Customer__c> deletedCustomers = Trigger.old;
    for(Customer__c c : deletedCustomers){
    	List<Complaint__c> relatedComplaints = [Select Id from Complaint__c where Raised_By__c =:c.Id];
        system.debug(relatedComplaints);
        delete relatedComplaints;
    }
    
    system.debug(deletedCustomers);
}