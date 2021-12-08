public class InsertRecordController {
@AuraEnabled
    public static Account insertAccount(Account accRec){
         System.debug('accRec...'+accRec);
        try{
            insert accRec;
            return accRec;
        }
        Catch(Exception e){
             throw new AuraHandledException(e.getMessage());
        }
    }
}