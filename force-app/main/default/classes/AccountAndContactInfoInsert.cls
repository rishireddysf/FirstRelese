global class AccountAndContactInfoInsert {

    global class AccountAndContactInfo{
        webservice String accName;
        webservice String accNumber;
        webservice ContactInfo ctRec;
        
    }
    global class ContactInfo{
        Webservice String ctLastName;
        Webservice String ctFisrtName;
        Webservice String ctEmail;
    }
    webservice static Id insertAccount(AccountAndContactInfo accInfo){
        Account acc = new Account();
        acc.Name = accInfo.accName;
        acc.AccountNumber = accInfo.accNumber;
        acc.Active__c = 'Yes';
        insert acc;
        Contact ct = new Contact();
        ct.LastName = accInfo.ctRec.ctLastName;
        ct.FirstName = accInfo.ctRec.ctFisrtName;
        ct.Email = accInfo.ctRec.ctEmail;
        ct.AccountId = acc.Id;
        insert ct;
        return acc.Id;
    }
}