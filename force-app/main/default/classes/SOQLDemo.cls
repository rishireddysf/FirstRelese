public class SOQLDemo {
    public SOQLDemo(){
        //List<Account> accRecList =[SELECT Id,Name,AccountNumber FROM Account LIMIT 1];
        /*Account accRec =[SELECT Id,Name,AccountNumber FROM Account LIMIT 1];
String accNumber = accRec.AccountNumber;*/
        String accNumber = [SELECT Id,Name,AccountNumber FROM Account LIMIT 1].AccountNumber;
        //system.debug('accRecList...'+accRecList);
        //List<sObject> ctRecList =[SELECT Name FROM Contact];
        List<Account> accRecList =[SELECT Id,Name,AccountNumber FROM Account WHERE Name= 'skgdsgfhgsdhgfh' LIMIT 1];
        if(!accRecList.isEmpty()){
            Account acc = accRecList[0];
        }
    }
}