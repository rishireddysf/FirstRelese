import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import getAccountRecords from "@salesforce/apex/AccountSearchController.searchAccountRecords";
export default class LWCAccountSearch extends LightningElement {
  searchValue='';
  accountList = [];
  searchKeyword(event){
      searchValue = event.target.value;
  }

   handleSearchKeyword() {
        if (this.searchValue !== '') {
            getAccountRecords({accName: this.searchValue})
                .then(result => {
                    this.accountList = result;
                })
                .catch(error => {
                    const event = new ShowToastEvent({
                        title: 'Error',
                        variant: 'error',
                        message: error.body.message,
                    });
                    this.dispatchEvent(event);
                    // reset contacts var with null   
                    this.accountList = null;
                });
        } else {
            // fire toast event if input field is blank
            const event = new ShowToastEvent({
                variant: 'error',
                message: 'Search text missing..',
            });
            this.dispatchEvent(event);
        }
    }
}