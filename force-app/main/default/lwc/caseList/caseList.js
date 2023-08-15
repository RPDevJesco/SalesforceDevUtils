import { LightningElement, wire } from 'lwc';
import getCases from '@salesforce/apex/CaseController.getCases';

const columns = [
    { label: 'Case Number', fieldName: 'CaseNumber' },
    { label: 'Subject', fieldName: 'Subject' },
    { label: 'Status', fieldName: 'Status' }
];

export default class CaseList extends LightningElement {
    columns = columns;

    @wire(getCases)
    cases;

    handleRowAction(event) {
        // Handle row actions (if any)
    }
}
