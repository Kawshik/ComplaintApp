({
    doinit : function(component, event, helper) {
    	$A.util.addClass(component.find("search-result"), "slds-hide");
    },
    
	search : function(component, event, helper) {
        event.preventDefault();
		//var searchText = component.get("v.search");
        var searchText = component.find("search").get("v.value");
        
        helper.getSearchResults(searchText,component);
        
	}
})