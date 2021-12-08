public class InsertMultipleRecordsController {

@AuraEnabled
    public static void insertMultipleRecors(List<Account> accList){
        insert accList;
    }
}