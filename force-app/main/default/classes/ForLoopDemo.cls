public class ForLoopDemo {
    public static void forLoopDemoMethod(){
        List<String> accNameList = new List<String>();
        Set<String> accNameSet = new Set<String>();
        //Map<AccountName,AccountNumber
        Map<String,String> accMap = new Map<String,String>();
        //accNameList.add('naga');
        //accNameList.add('Mani');
        List<Account> accList = [Select Id,Name,AccountNumber FROM Account];
       /* for(Integer i = 0 ;accList.size() > i; i++){
             Account accRec = accList[i];
             String accName = accRec.Name;
             accNameList.add(accName);
             accNameList.add(accList[i].Name);
        }*/
       
        //For Each
        for(Account accRec :accList){
            //System.SObjectException: SObject row was retrieved via SOQL without querying the requested field: Account.Name
            if(accRec.AccountNumber != null || accRec.AccountNumber  != ''){
                accNameList.add(accRec.Name);
                accNameSet.add(accRec.Name);
            }
            accMap.put(accRec.Name,accRec.AccountNumber);
        }
       system.debug('accNameList...'+accNameList);
       system.debug('accMap...'+accMap);
    }
}