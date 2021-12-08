global class WBAccountInfo {
    webservice static Account accountInfo(String accNumber){
        return [Select Id,Name From Account where AccountNumber =:accNumber];        
    }
}