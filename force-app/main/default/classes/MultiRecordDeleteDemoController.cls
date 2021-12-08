public class MultiRecordDeleteDemoController {
    public List<Account> accList{set;get;}
    List<Account> deleteAccList = new List<Account>();
    public  MultiRecordDeleteDemoController() {
        accList = [Select Id,NAme,SelectedRecord__c from Account];
    }
    public void deleteSelectedRecords(){
        
        for(Account accRec : accList){
            if(accRec.SelectedRecord__c){
                deleteAccList.add(accRec);
            }            
        }
        if(!deleteAccList.isempty()){
            delete deleteAccList;
        }
    }
}