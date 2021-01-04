public with sharing class NavbarController {
    public NavbarController() {

    }

    @AuraEnabled(Cacheable = true)
    public static string getCurrentUserName(String userId){ 
        User user = [Select Id , Name ,Email from User where Id =:userId];
        return user.Name;
    }
}