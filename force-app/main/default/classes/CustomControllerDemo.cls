public class CustomControllerDemo {
    public Opportunity opp {set;get;}
    //public string accName {set;get;}
    public String accName;
    public void setAccName(String accName){
        system.debug('Inside setter');
        this.accName = accName;
    }
    public String getAccName(){
        system.debug('Inside getter');
        accName = 'test get account';
        return accName;
    }
    public string accNumber {set;get;}
    public String ctFirstName {set;get;}
    public String ctLastName {set;get;}
    public String ctEmail{set;get;}
    public date dob{set;get;}
    public CustomControllerDemo(){
        system.debug('Inside cons');
        //accName = 'Test Account';
        opp = new Opportunity();
    }
   
    public void saveAccount(){
        system.debug('accName..'+accName);
        system.debug('accNumber..'+accNumber);
        Account accRec = new Account();
        accRec.Name  = accName;
        accRec.AccountNumber = accNumber;
        accRec.Active__c = 'Yes';
        insert accRec;
        system.debug('accRec.....'+accRec);
        insert new Contact(LastName=ctLastName,FirstName =ctFirstName,Email=ctEmail,AccountId=accRec.Id);     

        
    }
}