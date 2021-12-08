global class WBAccountAndContactInfoInsertV1 {
    global class AccountAndContactInfo{
        webservice String accName;
        webservice String accNumber;
        webservice List<ContactInfo> ctRecList;
        
    }
    global class ContactInfo{
        Webservice String ctLastName;
        Webservice String ctFisrtName;
        Webservice String ctEmail;
    }
    global class insertAccountResponse{
        Webservice String errorMessage;
        Webservice String sucessMessage;
        Webservice Id accountId;
        Webservice List<Id> contactIds;
        global insertAccountResponse(){
            contactIds = new List<Id>();
        }
    }
    webservice static insertAccountResponse insertAccount(AccountAndContactInfo accInfo){
        insertAccountResponse responseObj = new insertAccountResponse();
        Account acc = new Account();
        acc.Name = accInfo.accName;
        acc.AccountNumber = accInfo.accNumber;
        acc.Active__c = 'Yes';
        try{
        	insert acc;
            responseObj.sucessMessage = 'Record Inserted Successfully';
            responseObj.accountId = acc.Id;
        }Catch(Exception e){
            responseObj.errorMessage = e.getMessage();
        }
        List<Contact> ctList = new List<Contact>();
        for(ContactInfo ctRec :accInfo.ctRecList){
            Contact ct = new Contact();
            ct.LastName = ctRec.ctLastName;
            ct.FirstName = ctRec.ctFisrtName;
            ct.Email = ctRec.ctEmail;
            ct.AccountId = acc.Id;
            ctList.add(ct);
        }
        
        insert ctList;
        for(Contact ctRec : ctList){
            responseObj.contactIds.add(ctRec.Id);
        }
        //return acc.Id;
        return responseObj;
    }
}