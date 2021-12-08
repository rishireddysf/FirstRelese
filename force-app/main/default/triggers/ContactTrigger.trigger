trigger ContactTrigger on Contact (before insert,before update,before delete,after insert, after update, after delete, after undelete) {
    
    List<Contact> ctNewList = Trigger.new;
    Map<Id,Contact> ctNewMap = Trigger.newMap;
    List<Contact> ctOldList = Trigger.old;
    Map<Id,Contact> ctOldMap = Trigger.oldMap;
    if(Trigger.isBefore){
        if(Trigger.isInsert){
            /*Contact ctNewRec = Trigger.new[0];
            if(ctNewRec.Email ==  null){
                ctNewRec.Email.addError('Please Enter Email');
            }*/
            ContactTriggerHelper.validateContactEmail(Trigger.new);
            ContactTriggerHelper.validateContactActivation(Trigger.new);
            ContactTriggerHelper.updateInactiveReason(Trigger.new);
            //US#1234 - Change by Manideep - 16-10-2021
            //ContactTriggerHelper.validateInactiveContactUndelte(Trigger.new,Trigger.newMap);
        }
        if(Trigger.isUpdate){
            ContactTriggerHelper.validateContactEmail(Trigger.new);
            ContactTriggerHelper.validateContactActivation(Trigger.new);
            ContactTriggerHelper.updateInactiveReason(Trigger.new);
            ContactTriggerHelper.validateEmailChange(Trigger.new,Trigger.old,Trigger.newMap,Trigger.oldMap);
        }
        if(Trigger.isDelete){
        }
        
    }
    if(Trigger.isAfter){
        if(Trigger.isInsert){
            ContactTriggerHelper.updateContactCountonAccount(Trigger.new,Trigger.old,Trigger.newMap,Trigger.oldMap);
        }
        if(Trigger.isUpdate){
            ContactTriggerHelper.updateContactCountonAccount(Trigger.new,Trigger.old,Trigger.newMap,Trigger.oldMap);
        }
        if(Trigger.isDelete){
            ContactTriggerHelper.updateContactCountonAccount(Trigger.new,Trigger.old,Trigger.newMap,Trigger.oldMap);
        }
        if(Trigger.isUnDelete){
            ContactTriggerHelper.updateContactCountonAccount(Trigger.new,Trigger.old,Trigger.newMap,Trigger.oldMap);
            ContactTriggerHelper.validateInactiveContactUndelte(Trigger.new,Trigger.newMap);
        }
    }
}