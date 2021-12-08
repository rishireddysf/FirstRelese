import { LightningElement,track} from 'lwc';

export default class WelcomeLWC extends LightningElement {
    searchValue = '';
 
    // update searchValue var when input field value change
    searchKeyword(event) {
       // this.searchValue = event.target.value;
      //  console.log('searchValue....'+searchValue);
    }
}