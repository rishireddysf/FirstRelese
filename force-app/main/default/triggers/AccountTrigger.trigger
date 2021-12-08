trigger AccountTrigger on Account (before insert,before update,before delete,after insert, after update, after delete, after undelete) {
    
    List<Account> accNewList = Trigger.new;
    Map<Id,Account> accNewMap  = Trigger.newMap;
    List<Account> accOldList = Trigger.old;
    Map<Id,Account> accOldMap = Trigger.oldMap;
    Integer recordCount  = Trigger.size;//Max 200
    System.debug('recordCount....'+recordCount);
    List<Account> acc = [Select Id from Account];
    /*switch on Trigger.operationType {
        when BEFORE_INSERT{
          
        }
        when BEFORE_UPDATE{
            //Do after update stuff
        }
        when BEFORE_DELETE{
            //Do after update stuff
        } 
        when AFTER_INSERT{
            //Do after update stuff
        }
        when AFTER_UPDATE{
            //Do after update stuff
        } 
        
    }*/
    if(Trigger.isBefore){
        if(Trigger.isInsert){
           AccountTriggerHelper.validatePINandUpdateAddress(Trigger.new,Trigger.NewMap);
        }
        if(Trigger.isUpdate){
            AccountTriggerHelper.validatePINandUpdateAddress(Trigger.new,Trigger.NewMap);
        }
        if(Trigger.isDelete){
            AccountTriggerHelper.validateAccountDelete(Trigger.old,Trigger.oldMap);
        }
        
    }
    if(Trigger.isAfter){
       /* if(Trigger.isInsert){
            for(Integer i =0 ; i<150;i++){
                Department__c dept = new Department__c();
                dept.Name = 'test'+i;
                insert dept;
            }
           AccountTriggerHelper.createOnboardingSteps(Trigger.new,Trigger.NewMap,true,false);
        }*/
        if(Trigger.isUpdate){
            AccountTriggerHelper.createOnboardingSteps(Trigger.new,Trigger.NewMap,false,true);
            AccountTriggerHelper.updateContactsMailingAddress(Trigger.new,Trigger.NewMap,Trigger.old,Trigger.oldMap);
        } 
        if(Trigger.isDelete){
            
        }
        if(Trigger.isUnDelete){
           
        }
    }
/* 200
before 
259
after
259 + 200 = 459
20
before
459
after
459 + 20 
*/
}