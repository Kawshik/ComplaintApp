import { LightningElement, track, wire } from 'lwc';
import getComplaintByTicket from '@salesforce/apex/ComplaintsAppController.getComplaintByTicket';
export default class ComplaintSearch extends LightningElement {
    @track complaint;
    @track complaintName;
    @track complaintDescription;
    @track complaintMainCategory;
    @track complaintSubCategory;
    @track complaintStatus;
    @track complaintSeverity;
    
    @track ticketId;
    error;

    searchKeyword(event) {
        this.ticketId = event.target.value;
    }

    @wire(getComplaintByTicket,{
        ticketId: '$ticketId'
    }) 
    appName({
        error,data
    }){
        if(data){
            this.complaint = data;  
            console.log(this.complaint.Id);
            this.complaintName = this.complaint.Name;
            this.complaintDescription = this.complaint.Description__c;
            this.complaintMainCategory = this.complaint.Main_Category_Dump__c;
            this.complaintSubCategory = this.complaint.Sub_Category_Dump__c;
            this.complaintStatus = this.complaint.Status__c;
            this.complaintSeverity = this.complaint.Severity__c;
            this.error = undefined;
        }
        else if(error) {
            this.error = error;
            this.complaint = undefined;
        }
    }
}