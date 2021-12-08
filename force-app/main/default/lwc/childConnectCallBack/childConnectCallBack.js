import { LightningElement } from 'lwc';
export default class ChildConnectCallBack extends LightningElement {
 connectedCallback(){
        window.console.log('Inside child connectedCallback');
    }
    renderedCallback() {
        window.console.log('Inside child renderedCallback');
    }
}