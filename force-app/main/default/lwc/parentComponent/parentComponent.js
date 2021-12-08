import { LightningElement } from 'lwc';
export default class ParentComponent extends LightningElement {
    progressValue;
    callChild(){
        //firing an child method
        this.template.querySelector("c-child-component").handleNameChange();
    }

    hanldeProgressValueChange(event){
        this.progressValue =event.detail;
    }
}