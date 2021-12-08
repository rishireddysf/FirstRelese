public class AccountSearchController {
     public AccountSearchController(){
          
     }
 @AuraEnabled
 public static List<Account> searchAccountRecords(String accName){
      List<Account> accList = [Select Id,Name,AccountNumber,Website From Account where name like : '%'+accName+'%' ];
      return accList;
 }
}