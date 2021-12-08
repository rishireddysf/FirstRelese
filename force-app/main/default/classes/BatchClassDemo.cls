public class BatchClassDemo implements Database.Batchable<sObject>,Schedulable{
    public Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator('Select Id,Ready_To_delete__c from Account');
    }
    public void execute(Database.BatchableContext BC, list<sObject> scope){
        List<Account> accList = (List<Account>)scope;
        List<Account> deleteList = new List<Account>();
        for(Account accRec: accList){
            if(accRec.Ready_To_delete__c){
                deleteList.add(accRec);
            }
        }
        if(!deleteList.isEmpty()){
            delete deleteList;
        }
    }
    public void finish(Database.BatchableContext BC){
        AsyncApexJob a = [SELECT Id, Status, NumberOfErrors, JobItemsProcessed,
                          TotalJobItems, CreatedBy.Email
                          FROM AsyncApexJob WHERE Id =
                          :BC.getJobId()];
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        List<String> toAddresses = new List<String> {a.CreatedBy.Email,'rishicloud.sfdc@gmail.com'};
        mail.setToAddresses(toAddresses);
        mail.setSubject('Apex Sharing Recalculation ' + a.Status);
        mail.setPlainTextBody
            ('The batch Apex job processed ' + a.TotalJobItems +
             ' batches with '+ a.NumberOfErrors + ' failures.');
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
        
    }
     public void execute(SchedulableContext sc){
        //BatchClassDemo obj = new BatchClassDemo();
        Database.executeBatch(new BatchClassDemo(), 10);
        
    }
    
}