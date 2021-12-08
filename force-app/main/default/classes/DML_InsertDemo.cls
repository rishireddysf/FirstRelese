public class DML_InsertDemo {
    public DML_InsertDemo(){
        
    }
    public static void insertAccount(){
        Account accRec = new Account();
        accRec.Name = 'Test Apex Record 1';
        accRec.AccountNumber = 'Acc1234';
        accRec.Site = 'www.apex12.com';
        system.debug('Before Record accRec...'+accRec);
        //insert accRec;
        system.debug('After Record accRec...'+accRec);
        //second Record
        Account accRec1 = new Account();
        accRec1.Name = 'Test Apex Record 2';
        accRec1.AccountNumber = 'Acc12345';
        accRec1.Site = 'www.apex13.com';
        system.debug('Before Record accRec...'+accRec1);
        //insert accRec1;
        system.debug('After Record accRec...'+accRec1);
        List<Account> accList = new List<Account>();
        accList.add(accRec);
        accList.add(accRec1);
        insert accList;
    }
    public static void insertStudent(){
        Student__c stdRec = new Student__c();
        stdRec.Name = 'Naga';
        stdRec.Fee__c = 123.34;
        stdRec.Student_Email__c = 'test@apex.xom';
        stdRec.Department__c = 'a015g00000XQltoAAD';
        insert stdRec;
    }
    Public static void insertAccountAndContact(){
        Account accRec = new Account();
        accRec.Name = 'Parent Account';
        accRec.Active__c = 'Yes';
        insert accRec;
        system.debug('accRec....'+accRec);
        Contact ctRec1 = new Contact();
        ctRec1.LastName  = 'Rishi';
        ctRec1.AccountId = accRec.Id;
        
        Contact ctRec2 = new Contact();
        ctRec2.LastName  = 'Rishi';
        ctRec2.AccountId = accRec.Id;
        List<Contact> ctList = new List<Contact>{ctRec1,ctRec2};
        insert ctList;
        system.debug('ctRec....'+ctList);
    }
    
    Public static Id insertCase(){
         Id caseNeSofwareRecordTypeId;
        /*List<RecordType> cseRTList = [SELECT Id, Name, DeveloperName, SobjectType, IsActive FROM RecordType where SobjectType='case' and IsActive = true];
        for(RecordType rt : cseRTList){
            if(rt.DeveloperName == 'New_Software_Request'){
                caseNeSofwareRecordTypeId = rt.Id;
            }
        }*/
        //RecordType cseRTRec = [SELECT Id, Name, DeveloperName from RecordType where DeveloperName='New_Software_Request' and SobjectType='case'];
        //Id caseRtId = [SELECT Id, Name, DeveloperName from RecordType where DeveloperName='New_Software_Request' and SobjectType='case'].Id;
        //If no record found in databse ..System.QueryException: List has no rows for assignment to SObject
        //List<RecordType> cseRTList = [SELECT Id, Name, DeveloperName from RecordType where DeveloperName='New_Software_Request' and SobjectType='case'];
        //Id caseNewSftRecordTypeId = Schema.SObjectType.Case.getRecordTypeInfosByName().get('New Software Request').getRecordTypeId();
        /*Map<String,RecordTypeInfo> rtMap = Schema.SObjectType.Case.getRecordTypeInfosByDeveloperName();
        RecordTypeInfo rtInfo = rtMap.get('New_Software_Request');
        Id caseNewSftRecordTypeId = rtInfo.getRecordTypeId();*/
        Id caseNewSftRecordTypeId = Schema.SObjectType.Case.getRecordTypeInfosByDeveloperName().get('New_Software_Request').getRecordTypeId();
        /*Case cs = new Case();
        cs.Status = 'New';
        cs.Origin = 'Phone';
        cs.Subject = 'Test Cs Craete';
        if(caseNewSftRecordTypeId != null){
             cs.RecordTypeId = caseNewSftRecordTypeId;
        }*/
        /*if(!cseRTList.isEmpty()){
            //RecordType rtRec = cseRTList[0];
            //cs.RecordTypeId = rtRec.Id;
            cs.RecordTypeId =cseRTList[0].Id;
        }*/
        //cs.RecordTypeId = cseRTRec.Id;
        //cs.RecordTypeId = caseNeSofwareRecordTypeId;
        //cs.RecordTypeId = '0125g000000qMN3';
        Case cs = new Case(Status = 'New',Origin = 'Phone',RecordTypeId = caseNewSftRecordTypeId);
        insert cs;
        return cs.Id;
        //select id,subject,recordTypeId,recordType.Name from case where id ='5005g00000ENQknAAH'
        //
    }
}