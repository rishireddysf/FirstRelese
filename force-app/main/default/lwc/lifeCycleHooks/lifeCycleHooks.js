import { LightningElement } from 'lwc';
import templateOne from './templateOne.html';
import templateTwo from './templateTwo.html';
export default class LifeCycleHooks extends LightningElement {
    templateOne = true;
    constructor(){
        super();
        window.console.log('inside constructor');
    }
    connectedCallback(){
        window.console.log('inside connectedCallback');
    }
    renderedCallback(){
        window.console.log('inside renderedCallback');
    }
    disconnectedCallback(){
        window.console.log('inside disconnectedCallback');
    }
    errorCallback(){
        window.console.log('inside errorCallback');
    }
    render() {
        window.console.log('inside render');
        return this.templateOne ? templateOne : templateTwo;
    }

    switchTemplate(){ 
        this.templateOne = this.templateOne === true ? false : true; 
    }
}