import { LightningElement } from 'lwc';
import insertAccountRecord from "@salesforce/apex/InsertRecordController.insertAccount";
import ACCOUNT_NAME from '@salesforce/schema/Account.Name';
import ACCOUNT_NUMBER from '@salesforce/schema/Account.AccountNumber';
import ACCOUNT_WEBSITE from '@salesforce/schema/Account.Website';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { NavigationMixin } from 'lightning/navigation';
import {createRecord} from 'lightning/uiRecordApi';
import ACCOUNT_OBJECT from '@salesforce/schema/Account'; 
export default class InsertRecord extends LightningElement {
    accountRecord = 
    {
        Name :ACCOUNT_NAME,
        AccountNumber:ACCOUNT_NUMBER,
        Website:ACCOUNT_WEBSITE
    };
    accountid;
    handleChangeAccount(event){
        
        if(event.target.name == 'name'){
            this.accountRecord.Name = event.target.value;
        }
        if(event.target.name == 'accountnumber'){
            this.accountRecord.AccountNumber = event.target.value;
        }
        if(event.target.name == 'website'){
            this.accountRecord.Website = event.target.value;
        }
        
    }
    //const fields = { Name: accountName.value};
    //const recordInput = { apiName: ACCOUNT_OBJECT.objectApiName, accountRecord };
    //https://developer.salesforce.com/docs/component-library/documentation/en/lwc/lwc.reference_lightning_ui_api_record
    saveAccount(){
        /*window.console.log('fields 1.....');
        const fields = {Name:this.accountRecord.Name,AccountNumber:this.accountRecord.AccountNumber,Website:this.accountRecord.Website};
        window.console.log('fields.....'+fields);
        const recordInput = { apiName: ACCOUNT_OBJECT.objectApiName, fields };
        createRecord(recordInput)
            .then(account =>{
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Success',
                        message: 'New account has been created',
                        variant: 'success',
                    }),
                );
            })
            .catch(error => {
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Error while creating account',
                        message: error.body.message,
                        variant: 'error',
                    }),
                );
            });*/
        insertAccountRecord({accRec:this.accountRecord})
        .then(result => {
                  this.accountRecord = result;
                  this.accountid =  result.Id;
                  window.console.log('accountid....'+this.accountid);
                  
                  const event = new ShowToastEvent({
                        title: 'Success',
                        variant: 'Success',
                        message: 'Account Record is created successfully....'+this.accountid
                    });
                    this.dispatchEvent(event);
                    // Generate a URL to a User record page
                    this[NavigationMixin.Navigate]({
                        type: 'standard__recordPage',
                        attributes: {
                            recordId: this.accountid,
                            objectApiName: 'Account',
                            actionName: 'view'
                        },
                    });
                })
        .catch(error => {});
    }
}