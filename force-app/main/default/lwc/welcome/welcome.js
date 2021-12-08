import { LightningElement,track,api,wire } from 'lwc';
import getAccounts from "@salesforce/apex/WelcomeLWCController.searchAccount";
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class Welcome extends LightningElement {
     columns =[
    { label: 'Account Name', fieldName: 'Name'},
    { label: 'Website', fieldName: 'Website', type: 'url' },
    { label: 'Account Number', fieldName: 'AccountNumber'}];
     accountList = [];
    searchValue ='';
    //@wire(searchAccount,{{searchString: this.searchValue}})
    //Reactive Calling, LDS(Lightnign data service) , Standard adptors ,cacahebale = true
    /*@wire(getAccounts,{searchString: '$searchValue'})
    getAccountList({error,data}){
        if(data){
            this.accountList = data;
        } else if(error){

        }
    }*/
    searchKeyword(event){
        this.searchValue = event.target.value;
        console.log('inside searchKeywordvalue....'+this.searchValue);
    }
    //Imperative calling, Asynchrnous, NO cachebale = true
    handleSearchKeyword() {
        console.log('inside handleSearchKeyword value....'+this.searchValue);
        if (this.searchValue !== '') {
            getAccounts({searchString: this.searchValue})
                .then(result => {
                    // set @track contacts variable with return contact list from server  
                    this.accountList = result;
                    window.console.log('this.accountList.....'+JSON.stringify(this.accountList));
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