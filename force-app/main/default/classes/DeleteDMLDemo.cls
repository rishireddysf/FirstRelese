public class DeleteDMLDemo {
   
    public static void deleteAccountRecords(){
        List<Account> accList = [Select Id,(Select Id from Contacts),(Select Id from Opportunities),(Select Id from Cases) from Account];
        List<Account> deleteAccountList = new List<Account>();
        for(Account accRec : accList){
            if(accRec.Contacts.isEmpty() && accRec.Opportunities.isEmpty() && accRec.Cases.isEmpty()){
                deleteAccountList.add(accRec);
            }
        }
        delete deleteAccountList;
    }
}