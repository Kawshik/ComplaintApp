global class ComplaintsSOAPClass {
	webservice static String getCustomerId(String username, String email){
        System.debug(username);
        System.debug(email);
        String query = 'SELECT Id FROM Customer__c WHERE Email__c = \'' + email + '\' AND Username__c = \'' + username + '\'';
        Customer__c[] customer = Database.query(query);
        if(customer.size() >= 1 ){
            system.debug(customer[0]);
            return customer[0].Id;
        } else {
            system.debug('this run...');
            return null;
        }
    }
    
    webservice static String createComplaints(String userId,String title,String description,String severity,String main_category,String sub_category){
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
    // https://kawshikdomain-dev-ed.my.salesforce.com/services/Soap/c/50.0/00D2w00000FZN6p/0DF2w000000Gsfy
    // 00D2w00000FZN6p!AQcAQF6rqbv.F9b6TWRdDVB7XKak6Z0woFRuMIVex1Wg9kjtCc8VPDQk.RY1YbwKrccDsvK6MzgXSZ7MOY4LKelhbhSqTUR1
}