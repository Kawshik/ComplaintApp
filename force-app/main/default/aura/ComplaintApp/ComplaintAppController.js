({
    doinit : function(component, event, helper) {
   		var userID = component.get("v.userId");
        //console.log(userID);
        if(userID === undefined){
            $A.util.addClass(component.find("register_form"), "slds-hide");
            $A.util.addClass(component.find("logout_btn"), "slds-hide");
            $A.util.addClass(component.find("history_btn"), "slds-hide");
            $A.util.addClass(component.find("login_btn"), "slds-hide");
            $A.util.addClass(component.find("complaint_form"), "slds-hide");
            $A.util.addClass(component.find("complaint_btn"), "slds-hide");
            $A.util.addClass(component.find("complaint_container"), "slds-hide");
        }
    },
    
	login : function(component, event, helper) {
        event.preventDefault();
        var email = component.find("text-login-email").get("v.value");
        var username = component.find("text-login-username").get("v.value");
        //console.log(email + username);
        if(email === undefined || username === undefined){
            component.set("v.errorMsg","Enter all the details...");
        } else {
            component.set("v.errorMsg","");
            helper.getCustomer(email,username,component);
        }
   
	},
    
    register : function(component, event, helper) {
        var email = component.find("text-register-email").get("v.value");
        var username = component.find("text-register-username").get("v.value");
        var fullName = component.find("text-register-fullname").get("v.value");
        var phone = component.find("text-register-phone").get("v.value");
        console.log(email + username);
        if(email === undefined || username === undefined){
            component.set("v.errorMsg","Enter all the details...");
        } else {
            component.set("v.errorMsg","");
            helper.registerCustomer(fullName, username, phone, email,component);
        }
    },
    
    logout : function(component, event, helper) {
        component.set("v.userId","");
        component.set("v.userName","");
        component.set("v.customer",null);
        
        $A.util.addClass(component.find("register_form"), "slds-hide");
        $A.util.addClass(component.find("logout_btn"), "slds-hide");
        $A.util.addClass(component.find("history_btn"), "slds-hide");
        $A.util.addClass(component.find("login_btn"), "slds-hide");
        $A.util.addClass(component.find("complaint_form"), "slds-hide");
        $A.util.removeClass(component.find("login_form"), "slds-hide");
        $A.util.removeClass(component.find("register_btn"), "slds-hide");
        
        
	},
    
    showRegister : function(component, event, helper) {
        $A.util.removeClass(component.find("register_form"), "slds-hide");
		$A.util.addClass(component.find("login_form"), "slds-hide");
        $A.util.removeClass(component.find("login_btn"), "slds-hide");
        $A.util.addClass(component.find("register_btn"), "slds-hide");
        
	},
    
    showLogin : function(component, event, helper) {
        $A.util.addClass(component.find("register_form"), "slds-hide");
		$A.util.removeClass(component.find("login_form"), "slds-hide");
        $A.util.addClass(component.find("login_btn"), "slds-hide");
        $A.util.removeClass(component.find("register_btn"), "slds-hide");
	},
    
    complaint : function(component, event, helper) {
        event.preventDefault();
        console.log(component.get("v.customer.Id"));
        console.log(component.get("v.title"));
        console.log(component.get("v.description"));
        console.log(component.get("v.severity"));
        console.log(component.get("v.main_category"));
        console.log(component.get("v.sub_category"));
        //userId,title,description,severity,main_category,sub_category,component
        helper.createComplaint(component.get("v.customer.Id"),
                              component.get("v.title"),
                              component.get("v.description"),
                              component.get("v.severity"),
                              component.get("v.main_category"),
                              component.get("v.sub_category"),
                              component);
	},
    
    showComplaintForm : function(component, event, helper){
        $A.util.removeClass(component.find("complaint_form"), "slds-hide");
        $A.util.addClass(component.find("complaint_container"), "slds-hide");
        
        $A.util.removeClass(component.find("history_btn"), "slds-hide");
        $A.util.addClass(component.find("login_btn"), "slds-hide");
        $A.util.addClass(component.find("complaint_btn"), "slds-hide");
        
        
    },
    
    showHistory : function(component, event, helper) {
        console.log("Ran");
        $A.util.removeClass(component.find("complaint_container"), "slds-hide");
        helper.getComplaints(component.get("v.customer.Id"),component);
        $A.util.addClass(component.find("complaint_form"), "slds-hide");
        $A.util.removeClass(component.find("complaint_btn"), "slds-hide");
        $A.util.addClass(component.find("history_btn"), "slds-hide");
    },
    
    toggleComplaintDetails : function(component, event, helper){
        var isExpanded = $A.util.hasClass(component.find("complaint_toggle_btn"), "arrow-down");
        if(isExpanded) $A.util.removeClass(component.find("complaint_toggle_btn"), "arrow-down");
        else $A.util.addClass(component.find("complaint_toggle_btn"), "arrow-down");
        console.log(isExpanded);
    }
    
})