import { LightningElement,api } from 'lwc';
export default class ChildComponent extends LightningElement {
@api name='Naga';
@api userName='nag.vempalli@gmail.com';
@api progressValue;
@api handleNameChange(){
    this.name = 'Rishi reddy Vempalli';
}

    handleChange(event){
        this.progressValue = event.target.value;
        //create event
        const selectedEvent = new CustomEvent("progressvaluechange",{detail:this.progressValue});
        //dispach the event
        this.dispatchEvent(selectedEvent);
    }
    //Add Event listerns
    renderedCallback(){
        const btn = this.template.querySelector(".myBtn");
        btn.addEventListener("click", this.firstFunction);
        btn.addEventListener("click", this.secondFunction);
    }
    
    firstFunction(){
        console.log("The first function executed successfully!");
    }
        
    secondFunction() {
        console.log("The second function executed successfully");
    }
}