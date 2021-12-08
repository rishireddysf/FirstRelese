public class DatbaseDMLUpdateDemo {
    public static void updateAccounts(){
        List<Account> accList =[Select Id,AccountNumber,BillingState from Account];
        for(Account accRec : accList){
            /*String accNumber  = accRec.AccountNumber;
String conatainsKey = '123';
if(accNumber.contains(conatainsKey)){

}*/
            if(accRec.AccountNumber.contains('123')){
                accRec.AccountNumber = '';
            }else{
                accRec.AccountNumber = accRec.AccountNumber +'-'+ accRec.BillingState;
            }
        }
        //update accList;
        List<Database.SaveResult> updatedAccList = Database.update(accList,false);
        List<Id> accSuccessIdList = new List<Id>();
        List<Id> accFailIdList = new List<Id>();
        for(Database.SaveResult saveRec : updatedAccList){
            if (saveRec.isSuccess()) {
                // Operation was successful, so get the ID of the record that was processed
                System.debug('Successfully inserted account. Account ID: ' + saveRec.getId());
                accSuccessIdList.add(saveRec.getId());
            }
            else {
                // Operation failed, so get all errors                
                for(Database.Error err : saveRec.getErrors()) {
                    System.debug('The following error has occurred.');                    
                    System.debug(err.getStatusCode() + ': ' + err.getMessage());
                    System.debug('Account fields that affected this error: ' + err.getFields());
                }
            }
        }
        system.debug('accSuccessIdList....'+accSuccessIdList);
    }
}