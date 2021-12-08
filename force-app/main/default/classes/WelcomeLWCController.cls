public class WelcomeLWCController {
    public WelcomeLWCController(){
        
    }
    public static List<account> accList;
    @AuraEnabled(cacheable=true)
    public static List<Account> searchAccount(String searchString){
        System.debug('inside searchAccount :'+searchString);
        // if(accList == null){
            accList = [SELECT Id, Name, AccountNumber, Website FROM Account where name like : '%'+searchString+'%' ];
             return accList;
     //   }else{
     //       return accList;
     //   }
    }

}