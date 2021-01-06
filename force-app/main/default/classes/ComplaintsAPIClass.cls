@RestResource(urlMapping='/Complaints/*')
global class ComplaintsAPIClass {

    @HttpGet
    global static List<Complaint__c> getComplaints() {
        List<Complaint__c> comp;
        
        try{
            comp = [SELECT Id, Name,Status__c FROM Complaint__c];
        } catch(Exception e){
            System.debug(e.getMessage());
        }
        system.debug(RestContext.request.params.get('param'));
        return comp;
    }
    
    @HttpPost
    global static String createComplaints(String userId,String title,String description,String severity,String main_category,String sub_category) {
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
    
}