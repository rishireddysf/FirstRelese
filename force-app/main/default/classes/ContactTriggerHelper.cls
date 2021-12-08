public class ContactTriggerHelper {
    Public static Id caseNewSftRecordTypeId = Schema.SObjectType.Case.getRecordTypeInfosByDeveloperName().get('New_Software_Request').getRecordTypeId();
    public static void validateContactEmail(List<Contact> ctNewList){
        for(Contact ctNewRec : ctNewList){
            if(String.isBlank(ctNewRec.Email)){
                ctNewRec.Email.addError('Please Enter Email');
            }else  if(ctNewRec.Email.contains('@gmail.com')){
                //ctNewRec.Email.addError('Please Enter Corporate Email only');
                ctNewRec.Email.addError(System.Label.Contat_Trigger_ValidateEmail);
            }
        }  
    }
    
    public static void validateContactActivation(List<Contact> ctNewList){
        for(Contact ctNewRec : ctNewList){
            if(!ctNewRec.is_Active__c && ctNewRec.Inactivate_Reason__c == null){
                ctNewRec.addError('Please fill Inactivate Reason when contact is Inactive');
            }
        }
    }
    
    public static void updateInactiveReason(List<Contact> ctNewList){
      
        for(Contact ctNewRec : ctNewList){
            if(ctNewRec.Is_Active__c){
                ctNewRec.Inactivate_Reason__c = null;
            }
        }
    }
    Public static void validateEmailChange(List<Contact> ctNewList, List<Contact> ctOldList, Map<Id,Contact> ctNewMap,Map<Id,Contact> ctOldMap){
        /*for(Contact ctNewRec :  ctNewList){
            for(Contact ctOldRec : ctOldList){
                if(ctNewRec.Id == ctOldRec.Id && ctNewRec.Email != ctOldRec.Email){
                    ctNewRec.addError('can not chnage email. please contact admin');
                }
            }
        }*/
        /*Id profilelId = UserInfo.getProfileId();
        String profileName = [Select Id,NAme from Profile where id =: profilelId].Name;*/
        String profileName = [Select Id,NAme from Profile where id =: UserInfo.getProfileId()].Name;
        system.debug('profileName....'+profileName);
        String loggedinUserName = UserInfo.getUserName();
        if(profileName == 'System Administrator' || loggedinUserName == 'saikumar60.p@gmail.com.q2'){
            return;
        }
        //for(Contact ctNewRec :  ctNewList){
        for(Contact ctNewRec :  ctNewMap.values()){
            if(ctOldMap.get(ctNewRec.Id).Email  != ctNewRec.Email){
                 ctNewRec.addError('can not chnage email. please contact admin');
            }
        }
    }
    public static void updateContactCountonAccount(List<Contact> ctNewList, List<Contact> ctOldList, Map<Id,Contact> ctNewMap,Map<Id,Contact> ctOldMap ){
        if(ApexConstants.isAccountTriggerRunning){
           return;
           
        } else{
             ApexConstants.isContactTriggerRunning = true;
        }
        set<Id> accIds= new set<Id>();
        if(ctNewList !=null){
            for(Contact c:ctNewList){
                if(c.AccountId!=null){
                    accIds.add(c.accountId);
                }
            }      
        }
        if(ctOldList!=null){
            for(Contact c:ctOldList){
                accIds.add(c.accountId);
            }
        }
        List<Account> accList = [Select Id, No_of_Contacts__c,(Select id from Contacts) from Account where Id IN: accIds];
        for(Account accRec:accList){
            accRec.No_of_Contacts__c = accRec.Contacts.size();
        } 
        if(!accList.isEmpty()){
            update accList;
        }
    } 
    Public static void validateInactiveContactUndelte(List<Contact> ctNewList,Map<Id,Contact> ctNewMap){
        for(Contact ctRec : ctNewList){
            if(!ctRec.is_Active__c){
                ctRec.addError('Can\'t undelete inactive contact' );
            }
        }
    }
}