public without sharing class AccountSelector {
    public AccountSelector(){
        
    }
    Public static List<Account> accList;
    public Static List<Account> searchAccount(String searchString){
        if(accList == null){
            accList = [Select Id,Name,AccountNumber	 From Account where name like : '%'+searchString+'%' ];
             return accList;
        }else{
            return accList;
        }
    }
    
}