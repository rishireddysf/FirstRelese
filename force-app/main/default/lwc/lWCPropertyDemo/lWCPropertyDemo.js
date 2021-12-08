import { LightningElement } from 'lwc';
export default class LWCPropertyDemo extends LightningElement {
    welcomemessage ='';
   handleOnchnage(event){
       this.welcomemessage = event.target.value;
   }
}