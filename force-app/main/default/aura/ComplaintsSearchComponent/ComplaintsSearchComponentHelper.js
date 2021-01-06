({
	getSearchResults : function(searchText,component) {
		var action = component.get("c.getComplaintByTicket");
        action.setParams({
            "ticketId": searchText.toString()
        });
        
        action.setCallback(this,function(response){
           var state = response.getState();
            if(state === "SUCCESS"){
                var data = response.getReturnValue();
                component.set("v.complaint", data);
                $A.util.removeClass(component.find("search-result"), "slds-hide");
            } else {
                alert("An error has occured...");
            }
        });
        $A.enqueueAction(action);
	}
})