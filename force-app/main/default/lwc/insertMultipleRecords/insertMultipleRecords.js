import { LightningElement,track } from 'lwc';
import createMultiRecords from '@salesforce/apex/InsertMultipleRecordsController.insertMultipleRecors';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
export default class InsertMultipleRecords extends LightningElement {
  @track keyIndex= 0;
  @track accRecList = [
                {Name: '',
                AccountNumber:'',
                Website:''
                }
                ];
    addRow(){
        window.console.log('inside addrow');
        this.keyIndex+1;
            this.accRecList.push(
                {
                    Name: '',
                    AccountNumber:'',
                    Website:''
                });
               
    }
    removeRow(event){
        window.console.log('removeRow')
        if(this.accRecList.length >=1){
            this.accRecList.length.splice(event.target.accessKey,1);
            this.keyIndex-1;
        }
    }
    changeHandler(event){
        if(event.target.name === 'accname'){
            this.accRecList[event.target.accessKey].Name = event.target.value;
        }else if(event.target.name === 'accnumber'){
            this.accRecList[event.target.accessKey].AccountNumber = event.target.value;
        } else if(event.target.name === 'accsite'){
            this.accRecList[event.target.accessKey].Website = event.target.value;
        }
    }
    saveMultipleAccounts(){
        createMultiRecords({accList:this.accRecList})
        .then(result=>{
            this.accRecList.forEach(function(item){
                item.Name = '';
                item.AccountNumber = '',
                item.Website = '';
            });
        })
        .catch(error =>{

        })
    }
}