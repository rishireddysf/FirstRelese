import { LightningElement,track } from 'lwc';
export default class ParentConnectCallBack extends LightningElement {
    name;
    connectedCallback(){
       this.name = 'connectedCallback' ;
        window.console.log('Inside parent connectedCallback');
    }

    renderedCallback() {
         this.name = 'renderedCallback' ;
        window.console.log('Inside parent renderedCallback');
    }
}