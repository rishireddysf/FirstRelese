public class DMLUpdateDemo {
    public static void updateAccountRecords(){
        List<Account> accList = [SELECT Id, Name, AccountNumber FROM Account];
        List<Account> updateAccList = new List<Account>();
        for(Account accRec : accList){
            //if(accRec.AccountNumber == null || accRec.AccountNumber == ''){
            if(String.isBlank(accRec.AccountNumber)){
                accRec.AccountNumber  = accRec.Name+' '+123;
                updateAccList.add(accRec);
            }
        }
        //update accList;
        update updateAccList;
    }
}