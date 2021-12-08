public class ParentSOQL_Demo {
    
    public static void childTOParentSOQL(){
        List<Student__c> stdList =  [Select Id, Name,Department__c,Department__r.Name,Department__r.code__c ,Department__r.Account__r.Name ,
                                     Department__r.Account__r.AccountNumber,Department__r.Account__r.Active__c,
                                     Department__r.Account__r.Parent.Name,Account_Parent_Name__c
                                     from Student__c where id='a005g000031I17O'];
        if(!stdList.isEmpty()){
            String accName = stdList[0].Department__r.Account__r.Name;
            system.debug('accName....'+accName);
            String accSatatus = stdList[0].Department__r.Account__r.Active__c;
            system.debug('accSatatus....'+accSatatus);
            String parentAccountName = stdList[0].Department__r.Account__r.Parent.Name;
            system.debug('parentAccountName....'+parentAccountName);
        } 
    }
    public static void parentToChildSOQL(){
        List<Contact> allCtList = new List<Contact>();
        List<Opportunity> alloppList = new List<Opportunity>();
        List<Account> accListWithoutContact =  new List<Account>();
        List<Account> accListWithContact =  new List<Account>();
        List<Account> accList = [Select Id, Name, (Select Id, Name from Contacts), (Select Id, Name from Opportunities) from Account];
        for(Account accRec : accList){
            /*List<Contact> ctList = accRec.Contacts;
            allCtList.addAll(ctList);*/
            if(accRec.Contacts.isEmpty()){
                accListWithoutContact.add(accRec);
            }else{
                accListWithContact.add(accRec);
            }
             allCtList.addAll(accRec.Contacts);
            /*List<Opportunity> oppList = accRec.Opportunities;
			  alloppList.addAll(oppList);*/
            alloppList.addAll(accRec.Opportunities);
        }
         system.debug('allCtList...'+allCtList.size());
        system.debug('alloppList...'+alloppList.size());
    }
}