public class AccountTriggerHelper {
    Public static void validateAccountDelete(List<Account> accOldLsit,Map<Id,Account> oldAccMap){
       /*List<Contact> ctList = [Select Id,AccountId from Contact where AccountId IN : oldAccMap.keyset()];
       Map<Id,List<Contact>> ctMap = new Map<Id,List<Contact>>();
        for(Contact ctRec : ctList){
            if(ctMap.containsKey(ctRec.AccountId)){
                List<Contact> ctExistingList = ctMap.get(ctRec.AccountId);
                ctExistingList.add(ctRec);
                ctMap.put(ctRec.AccountId,ctExistingList);
            }else{
                ctMap.put(ctRec.AccountId, new List<Contact>{ctRec});
            }
            
        }      
        for(Account accRec : accOldLsit){
            if(ctMap.get(accRec.Id).size()>0) {
                accRec.addError('Cannot delete Account when contacts associated');
            }
        }*/
        Map<Id,List<Contact>> ctMap = new Map<Id,List<Contact>>();
        for(Account accRec : [Select Id,(Select Id,AccountId From Contacts) from Account where Id IN :  oldAccMap.keyset()]){
            ctMap.put(accRec.Id,accRec.contacts);
        }
        for(Account accRec : accOldLsit){
            if(ctMap.get(accRec.Id).size()>0) {
                accRec.addError('Cannot delete Account when contacts associated');
            }
        }
    }
    
    public static void validatePINandUpdateAddress(List<Account> accNewList , Map<Id,Account> accNewMap){
        /*for(Account accRec : accNewList){
            List<PIN_Codes__c > pinList = [Select Id,name,City__c,Country__c,State__c from PIN_Codes__c where name =:accRec.BillingPostalCode];
            if(pinList.isEmpty()){
                accRec.adderror('Please enter a valid pincode');
            }else{
                accRec.BillingCountry = pinList[0].Country__c;
                accRec.BillingState= pinList[0].State__c;
                accRec.BillingCity = pinList[0].City__c;
            }
        }*/
        /*List<String> pinCodeList = new List<String>();
        for(Account accRec : accNewList){
            if(String.isNotBlank(accRec.BillingPostalCode)){
                 pinCodeList.add(accRec.BillingPostalCode);
            }
        }
        //List<PIN_Codes__c > pinList = [Select Id,name,City__c,Country__c,State__c from PIN_Codes__c where name IN : pinCodeList];
        Map<String, PIN_Codes__c> pinCodMap = new Map<String, PIN_Codes__c>();
        
        for(PIN_Codes__c pinRec : [Select Id,name,City__c,Country__c,State__c from PIN_Codes__c where name IN : pinCodeList]){
            pinCodMap.put(pinRec.Name,pinRec);
        }
       for(Account accRec : accNewList){
           if(pinCodMap.containsKey(accRec.BillingPostalCode)){
                accRec.BillingCountry = pinCodMap.get(accRec.BillingPostalCode).Country__c;
                accRec.BillingState= pinCodMap.get(accRec.BillingPostalCode).State__c;
                accRec.BillingCity = pinCodMap.get(accRec.BillingPostalCode).City__c;
           }else{
               accRec.adderror('Please enter a valid pincode');
           }
        }*/
        Map<String,PinInfo__c> pinfoMap = PinInfo__c.getAll();
        for(Account accRec : accNewList){
            if(accRec.BillingPostalCode != null){
                if(pinfoMap.containsKey(accRec.BillingPostalCode)){
                    accRec.BillingCountry = pinfoMap.get(accRec.BillingPostalCode).Country__c;
                    accRec.BillingState= pinfoMap.get(accRec.BillingPostalCode).State__c;
                    accRec.BillingCity = pinfoMap.get(accRec.BillingPostalCode).City__c;
                }else{
                    accRec.adderror('Please enter a valid pincode');
                }
            }
        }
    }
    
    
    Public static void createOnboardingSteps(List<Account> accNewList, Map<Id,Account> accNewMap,Boolean isAfterInsert, Boolean isAfterUpdate){
       List<Onboarding_Steps__c> onboardingStepList = new List<Onboarding_Steps__c>();
        for(Account accRec : accNewList){
            //Update
            if(accRec.Create_Onboarding_Steps__c && accRec.Active__c == 'Yes' && isAfterUpdate){
                onboardingStepList.addAll(insertOnboardingRecs(accRec));
            }
            //insert
            if(accRec.Active__c == 'Yes' && isAfterInsert){
               onboardingStepList.addAll(insertOnboardingRecs(accRec));
            }
        }
       /* if(!onboardingStepList.isEmpty()){
           insert onboardingStepList; 
        }*/
        String jsonString = json.serialize(onboardingStepList);
        /*wrapperOnbording obj = new wrapperOnbording(onboardingStepList);*/
        insertoOnboardingSteps(jsonString);
    }
    @future
    public static void insertoOnboardingSteps(String obj){
        List<Onboarding_Steps__c> onboardingStepList = (List<Onboarding_Steps__c>)Json.deserialize(obj,List<Onboarding_Steps__c>.class);
         if(!onboardingStepList.isEmpty()){
           insert onboardingStepList; 
        }
    }
    public static List<Onboarding_Steps__c> insertOnboardingRecs(Account accNewRec){
        system.debug('accNewRec....'+accNewRec);
        List<Onboarding_Steps__c> onboardingStepsList = new List<Onboarding_Steps__c>();
        Onboarding_Steps__c docOnbordingRec =  new Onboarding_Steps__c();
        docOnbordingRec.Name ='Document Verification';
        docOnbordingRec.start_Date__c = System.today();
        docOnbordingRec.end_Date__c = System.today()+5;
        docOnbordingRec.status__c = 'New';
        docOnbordingRec.Account__c = accNewRec.Id;
        onboardingStepsList.add(docOnbordingRec);
        
        Onboarding_Steps__c addressOnbordingRec =  new Onboarding_Steps__c();
        addressOnbordingRec.Name ='Address Verification';
        addressOnbordingRec.start_Date__c = System.today()+6;
        addressOnbordingRec.end_Date__c = System.today()+10;
        addressOnbordingRec.status__c = 'New';
        addressOnbordingRec.Account__c = accNewRec.Id;
        onboardingStepsList.add(addressOnbordingRec);
        
        
       /* if(!onboardingStepsList.isEmpty()){
            insert onboardingStepsList;
        }*/
        return onboardingStepsList;
    }
    public static void updateContactsMailingAddress(List<Account> accNewList, Map<Id,Account> accNewMap,List<Account> accOldList, Map<id,Account> accOldMap) {
        if(ApexConstants.isContactTriggerRunning){
            return;
        }else{
             ApexConstants.isAccountTriggerRunning = true;
        }
       /* List<Account> accList = [Select Id,(SELECT Id, AccountId,MailingStreet, MailingCity, MailingState, MailingPostalCode, MailingCountry FROM Contacts) from Account
                                where ID IN : accNewMap.keySet()];        
        List<Contact> ctUpdateList =  new List<Contact>();
        for(Account accRec : accList){
            for(Contact ctRec : accRec.Contacts){
                ctRec.MailingStreet = accNewMap.get(ctRec.AccountId).BillingStreet;
                ctUpdateList.add(ctRec);
            }
            
        } 
        if(!ctUpdateList.isEmpty()){
            update ctUpdateList;
        }*/
        List<Contact> ctList =  [SELECT Id, AccountId,MailingStreet, MailingCity, MailingState, MailingPostalCode, MailingCountry FROM Contact
                                WHERE AccountId IN : accNewMap.keySet()];
        for(Contact ctRec : ctList){
            ctRec.MailingStreet = accNewMap.get(ctRec.AccountId).BillingStreet;
            ctRec.MailingCity = accNewMap.get(ctRec.AccountId).BillingCity;
            ctRec.MailingState = accNewMap.get(ctRec.AccountId).BillingState;
            ctRec.MailingPostalCode = accNewMap.get(ctRec.AccountId).BillingPostalCode;
            ctRec.MailingCountry= accNewMap.get(ctRec.AccountId).BillingCountry;
        }
        if(!ctList.isEmpty()){
            update ctList;
        }
    }
    class wrapperOnbording{
        List<Onboarding_Steps__c> onboardingStepList;
        public wrapperOnbording(List<Onboarding_Steps__c> onboardingStepList){
            this.onboardingStepList = onboardingStepList;
        }
    }
}