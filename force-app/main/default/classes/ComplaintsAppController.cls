public class ComplaintsAppController {
    @AuraEnabled(Cacheable = true)
    public static Customer__c getCustomerId(String username, String email){
        System.debug(username);
        System.debug(email);
        String query = 'SELECT Id FROM Customer__c WHERE Email__c = \'' + email + '\' AND Username__c = \'' + username + '\'';
        Customer__c[] customer = Database.query(query);
        if(customer.size() >= 1 ){
            system.debug(customer[0]);
            return customer[0];
        } else {
            system.debug('this run...');
            return null;
        }
    }
    
    @AuraEnabled
    public static String createComplaints(String userId,String title,String description,String severity,String main_category,String sub_category){
        String mainCategoryQuery = 'SELECT Id FROM Main_Category__c WHERE Name = \'' + main_category + '\'';
        Main_Category__c[] mainCategory = Database.query(mainCategoryQuery);
        String Main_Category_Id = mainCategory[0].Id;
        
        String subCategoryQuery = 'SELECT Id FROM Sub_Category__c WHERE Name = \'' + sub_category + '\'';
        Sub_Category__c[] subCategory = Database.query(subCategoryQuery);
        String Sub_Category_Id = subCategory[0].Id;
        
        
        
        Complaint__c complaint = new Complaint__c(Name=title,
                                              	  Raised_By__c=userId,
                                                  Severity__c = severity,
                                                 Main_Category__c = Main_Category_Id,
                                                 Sub_Category__c = Sub_Category_Id,
                                                 Description__c = description);
        
        insert complaint;
        System.debug(complaint.Id);
        String complaintQuery = 'SELECT Ticket_Id__c FROM Complaint__c WHERE Id = \'' + complaint.Id + '\'';
        Complaint__c[] complaints = Database.query(complaintQuery);
        String ticket = complaints[0].Ticket_Id__c;
        return ticket;
    }
    
    @AuraEnabled
    public static String createCustomers(String fullName, String username, String phone, String email){
        String query = 'SELECT Id FROM Customer__c WHERE Email__c = \'' + email + '\' AND Username__c = \'' + username + '\'';
        Customer__c[] customer = Database.query(query);
        if(customer.size()>=1) return 'User Already Registered. Try Logging In...';
        
        Customer__c newCustomer = new Customer__c(Name=fullName,Username__c=username,Phone_Number__c=phone,Email__c=email);
        insert newCustomer;
        
        return 'Customer With Id: ' + newCustomer.Id + ' Has Been Registered.';
    }
    
    @AuraEnabled(Cacheable = true)
    public static Complaint__c[] getComplaintHistoryByUser(String userId){
        String query = 'SELECT Description__c,Id,Main_Category_Dump__c,Name,Status__c,Ticket_Id__c FROM Complaint__c WHERE Raised_By__c = \'' + userId + '\'';
    	Complaint__c[] complaints = Database.query(query);
        return complaints;
    }
    
    @AuraEnabled(Cacheable = true)
    //TKT#000026
    public static Complaint__c getComplaintByTicket(String ticketId){
        String searchquery='FIND {' + ticketId + '}IN ALL FIELDS RETURNING Complaint__c(Name,Description__c,Main_Category_Dump__c,Sub_Category_Dump__c,Status__c,Severity__c)'; 
		List<List<SObject>>searchList=search.query(searchquery);
        system.debug(searchList[0]);
        //String query = 'SELECT Description__c,Id,Main_Category_Dump__c,Name,Status__c,Ticket_Id__c FROM Complaint__c WHERE Raised_By__c = \'' + userId + '\'';
    	//Complaint__c[] complaints = Database.query(query);
        Complaint__c[] c = (Complaint__c[])searchList[0];
        return c[0];
    }
}