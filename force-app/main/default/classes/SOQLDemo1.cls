public class SOQLDemo1 {
    public SOQLDemo1(){
       
        /*List<Account> accList = new List<Account>([Select Id,Name,AccountNUmber FROM Account]);
        List<Account> accList = [Select Id,Name,AccountNUmber FROM Account];
        List<Account> accList  = new List<Account>();
        accList = [Select Id,Name,AccountNUmber FROM Account];*/
        /* List<Account> accList = [Select Id,Name,AccountNUmber FROM Account];
        Map<Id,Account> accMap = new Map<Id,Account>();
        for(Account accRec : accList){
            accMap.put(accRec.Id ,accRec);
        }*/
        Map<Id,Account> accMap = new Map<Id,Account>([Select Id,Name,AccountNUmber FROM Account]);
        List<Account> accList = accMap.values();
        
        Map<Id,Contact> ctMap = new Map<Id,Contact>([Select Id,Name,Accountid FROM Contact]);
        
    }
}