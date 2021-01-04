({
	getCustomer : function(email,username,component) {
		var action = component.get("c.getCustomerId");
        action.setParams({
            "username": username.toString(),
            "email": email.toString()
        });
        
        action.setCallback(this,function(response){
           var state = response.getState();
            if(state === "SUCCESS"){
                var data = response.getReturnValue();
                component.set("v.customer", data);
                if(data === null){
                    alert("You are not a Customer yet. Please Register...");;
                    $A.util.removeClass(component.find("register_form"), "slds-hide");
                    $A.util.addClass(component.find("login_form"), "slds-hide");
                    $A.util.removeClass(component.find("login_btn"), "slds-hide");
                    $A.util.addClass(component.find("register_btn"), "slds-hide");
                } else {
                    $A.util.removeClass(component.find("logout_btn"), "slds-hide");
                    $A.util.removeClass(component.find("history_btn"), "slds-hide");
                    $A.util.removeClass(component.find("complaint_form"), "slds-hide");
                    
                    $A.util.addClass(component.find("login_form"), "slds-hide");
                    $A.util.addClass(component.find("register_btn"), "slds-hide");
                }
            } else {
                alert("An error has occured...");
            }
        });
        $A.enqueueAction(action);
	},
    
    createComplaint : function(userId,title,description,severity,main_category,sub_category,component) {
        var action = component.get("c.createComplaints");
        action.setParams({
            "userId":userId.toString(),
            "title":title.toString(),
            "description":description.toString(),
            "severity":severity.toString(),
            "main_category":main_category.toString(),
            "sub_category":sub_category.toString()
        });
        
        action.setCallback(this,function(response){
           var state = response.getState();
            if(state === "SUCCESS"){
                alert("A Complaint with Ticket Id "+response.getReturnValue() + " has been created.");
            } else {
                alert("An error has occured...");
            }
        });
        $A.enqueueAction(action);
    }
})