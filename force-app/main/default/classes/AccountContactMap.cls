public class AccountContactMap {
    public AccountContactMap(){
        List<contact> ctList = [Select Id,AccountId,Account.Name,Name from Contact];
        //Map<AccountId,List<Contact>
        Map<Id,List<Contact>> accContactMap = new Map<Id,List<Contact>>();
        Map<Id,Contact> ctMap =  new Map<Id,Contact>();
        for(contact ctRec : ctList){
            ctMap.put(ctRec.Id,ctRec);
            String accNameId = ctRec.Id+'-'+ctRec.Account.Name;
            if(ctRec.AccountId != null){
                if(accContactMap.containskey(ctRec.AccountId)){
                    List<Contact> existingContactList = accContactMap.get(ctRec.AccountId);
                    existingContactList.add(ctRec);
                    accContactMap.put(ctRec.AccountId,existingContactList);
                }else{
                    List<Contact> contactList = new List<Contact>();
                    contactList.add(ctRec);
                    accContactMap.put(ctRec.AccountId,contactList);
                }
            } 
        }
        system.debug('accContactMap..'+accContactMap);
        //SOQL for loop
        Map<Id,List<Contact>> accContactMap1 = new Map<Id,List<Contact>>();
        for(Account accRec : [Select Id,Name,(Select Id,Name from Contacts) from Account]){
            accContactMap1.put(accRec.Id,accRec.contacts);
        }
    }
}