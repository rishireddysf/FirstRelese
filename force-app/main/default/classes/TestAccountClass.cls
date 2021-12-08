@isTest(seeAlldata= false)
public class TestAccountClass {
    @testSetup static void insertDAta(){
        PinInfo__c pinObj = new PinInfo__c();
        pinObj.Name = '500030';
        pinObj.City__c = 'test';
        pinObj.Country__c ='test';
        pinObj.State__c ='test';
        insert pinObj;
    }
    public testmethod static void testAccountNumberValidation(){
        Account acc = new Account();
        acc.Name = 'Test Account Number';
        try{
            insert acc; 
        }
        Catch(Exception e){
            system.debug('error message...'+e.getMessage());
            system.assertEquals('Insert failed. First exception on row 0; first error: FIELD_CUSTOM_VALIDATION_EXCEPTION, Account Number can\'t be blank: []', e.getMessage());
        }
    }
    public testmethod static void testValidatePINcodeAndUpdateAddress(){
        /*PinInfo__c pinObj = new PinInfo__c();
        pinObj.Name = '500030';
        pinObj.City__c = 'test';
        pinObj.Country__c ='test';
        pinObj.State__c ='test';
        insert pinObj;*/
        Account acc = new Account();
        acc.Name = 'Test Account Number';
        acc.BillingPostalCode = '500030';
        acc.AccountNumber='1245';
        try{
            insert acc;
            Account accUpdate = [Select Id,name from account where id =:acc.Id];
            accUpdate.Name='aletername';
            update accUpdate;
            
        }
        Catch(Exception e){
            system.debug('error message...'+e.getMessage());
        }
        
    }
}