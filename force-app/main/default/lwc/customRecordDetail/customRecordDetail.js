import { LightningElement, api, track, wire } from 'lwc';
import { updateRecord } from 'lightning/uiRecordApi';
import { getRecord } from 'lightning/uiRecordApi';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import getFieldsForSObject from '@salesforce/apex/UTIL_Fields.getAllFieldsForSObject';

export default class CustomRecordDetail extends LightningElement {
    @track queryResult;
    @api recordId;

    @wire(getFieldsForSObject, { objectName: 'Case' })
    wiredSObjectToQueryableString({ error, data }) {
        if (data) {
            this.queryResult = data;
        } else if (error) {
            console.error('Error calling getFieldsForSObject method:', error);
        }
    }

    handleRecordSave(event) {
        // Handle record save here if needed
    }

    handleRecordSuccess(event) {
        // Handle record success (e.g., show toast message) if needed
    }
}