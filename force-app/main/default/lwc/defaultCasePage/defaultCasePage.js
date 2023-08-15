import { LightningElement } from 'lwc';

export default class DefaultCasePage extends LightningElement {
    selectedCase;

    handleRowAction(event) {
        const selectedRow = event.detail.row;
        this.selectedCase = selectedRow;
    }
}