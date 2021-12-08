public class AccountContactInsertController {
    public Account acc {set;get;}
    public Contact ct {set;get;}
    public Opportunity opp {set;get;}
    public String successMessage{set;get;}
    public AccountContactInsertController(){
        acc = new Account();
        acc.Active__c = 'Yes';
        ct = new Contact();
        opp = new Opportunity();
    }
    public void saveAccount(){
        system.debug('acc.....'+acc);
        insert acc;
        ct.accountId = acc.Id;
        insert ct;
        opp.accountId = acc.Id;
        insert opp;
        if(acc.Id != null && ct.Id != null && opp.Id != null){
            successMessage = 'Account '+acc.Name+' inserted succeessfully';
        }
    }
}