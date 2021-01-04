import { api, LightningElement, track, wire } from 'lwc';
import getSortedAndFilteredComplaints from '@salesforce/apex/ComplaintsListController.getSortedAndFilteredComplaints';
export default class ComplaintsListComponent extends LightningElement {
    @api sortCriteria = 'DESC';
    @api filterCriteria = '';

    get sortOptions() {
        return [
            { label: 'Sort By Date - DESC', value: 'DESC' },
            { label: 'Sort By Date - ASC', value: 'ASC' },
        ];
    }

    handleSortCriteriaChange(event) {
        this.sortCriteria = event.detail.value;
    }

    get filterOptions() {
        return [
            { label: 'None', value: '' },
            { label: 'Status - Open', value: 'Open' },
            { label: 'Status - Processing', value: 'Processing' },
            { label: 'Status - Closed', value: 'Closed' },
            { label: 'Status - Cancelled', value: 'Cancelled' },
        ];
    }

    handleFilterCriteriaChange(event) {
        this.filterCriteria = event.detail.value;
    }

    columns = [
        { label: 'Name', fieldName: 'Name' },
        { label: 'Id', fieldName: 'Id' }
    ];

    //Gets the Complaints List Based on the criteria selected
    @track complaintsList;
    error;
    @wire(getSortedAndFilteredComplaints,{
        sortCriteria: '$sortCriteria', 
        filterCriteria: '$filterCriteria'
    }) 
    appName({
        error,data
    }){
        if(data){
            this.complaintsList = data;            
            this.error = undefined;
        }
        else if(error) {
            this.error = error;
            this.complaintsList = undefined;
        }
    }

}