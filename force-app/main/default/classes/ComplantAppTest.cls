@isTest
private class ComplantAppTest {
    @isTest static void testComplaintCreation(){
    	//Complaint__c testComplaint = new Complaint__c();
        Customer__c c = ComplaintsAppController.getCustomerId('ki','lodh.kawshik@gmail.com');
        System.debug(c);
        system.assertEquals(c,null);
    }
    
    @isTest static void TestDeleteCustomerWithComplaints() {
        Customer__c newCustomer = new Customer__c(Name='Test Customer',Username__c='test',Phone_Number__c='123456789',Email__c='test@test.com');
        insert newCustomer;
        Complaint__c complaint = new Complaint__c(Name='Test title',
                                              	  Raised_By__c=newCustomer.Id,
                                                  Severity__c = 'Low',
                                                 Main_Category__c = 'a0F2w000001TfslEAC',
                                                 Sub_Category__c = 'a0G2w000003zdrREAQ',
                                                 Description__c = 'Test Desc');
        insert complaint;
        
        Test.startTest();
        Database.DeleteResult result = Database.delete(newCustomer, false);
        Test.stopTest();
        
        System.assert(result.isSuccess());
    }
}