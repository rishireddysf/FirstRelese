public class WrapperDemoController {
    Public List<WrapperClass> accWrapperList{set;get;}
    public WrapperDemoController(){
        accWrapperList = new List<WrapperClass>();
        List<Account> accList = [Select Id,Name,AccountNUmber,(Select Id,Name From Contacts),(Select Id,Name From Opportunities),
                                 (Select Id,CaseNumber From  Cases) From Account];
        for(Account accRec : accList){
            accWrapperList.add(new WrapperClass(accRec, false,accRec.Contacts,accRec.Opportunities,accRec.Cases));
        }
    }
    public class WrapperClass{
        public Account accRec {set;get;}
        public Boolean isSelected {set;get;}
        public List<contact> ctList {set;get;}
        public List<Opportunity> oppList {set;get;}
        public List<Case> caseList {set;get;}
        Public List<contactsWrapperClass> ctWrapperList {set;get;}
        public WrapperClass(Account accRec, Boolean isSelected,List<contact> ctList,List<Opportunity> oppList,List<Case> caseList ){
            this.accRec = accRec;
            this.isSelected = isSelected;
            this.ctList = ctList;
            this.oppList =oppList;
            this.caseList = caseList;
            for(contact ctRec : ctList){
                
            }
           
        }
    }
    public class contactsWrapperClass{
        public Contact ctRec{set;get;}
        Public List<Task> taskList {set;get;}
        public contactsWrapperClass(Contact ctRec,List<Task> taskList){
            this.ctRec = ctRec;
            this.taskList =  taskList;
        }
    }
    public void deleteSelectedRecords(){
        List<Account> deleteAccList = new List<Account>();
        for(WrapperClass wrapperRec :accWrapperList){
            if(wrapperRec.isSelected){
                deleteAccList.add(wrapperRec.accRec);
            }
        }
        if(!deleteAccList.isEmpty()){
            delete deleteAccList;
        }
    }
}