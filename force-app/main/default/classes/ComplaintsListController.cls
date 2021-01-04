public with sharing class ComplaintsListController {
    
    public ComplaintsListController() {

    }

    @AuraEnabled(Cacheable = true)
    public static List<Complaint__c> getSortedAndFilteredComplaints(String sortCriteria, String filterCriteria){
        if(filterCriteria == ''){
            String query = 'SELECT Id,Name FROM Complaint__c ORDER BY CreatedDate ' + sortCriteria + ' LIMIT 20';
            List<Complaint__c> sobjList = Database.query(query);
            return sobjList;
        } else {
            String query = 'SELECT Id,Name FROM Complaint__c WHERE Status__c = \'' + filterCriteria + '\' ORDER BY CreatedDate ' + sortCriteria + ' LIMIT 20';
            List<Complaint__c> sobjList = Database.query(query);
            return sobjList;
        }
    }
}
