global class WBDemoClass {
   

    global class AccountAndContactInfo{
        webservice String accName;
        webservice String accNumber;
        Webservice String ctLastName;
        Webservice String ctFisrtName;
        Webservice String ctEmail;
    }
    webservice static Id insertAccount(AccountAndContactInfo accInfo){
        Account acc = new Account();
        acc.Name = accInfo.accName;
        acc.AccountNumber = accInfo.accNumber;
        insert acc;
        Contact ct = new Contact();
        ct.LastName = accInfo.ctLastName;
        ct.FirstName = accInfo.ctFisrtName;
        ct.Email = accInfo.ctEmail;
        ct.AccountId = acc.Id;
        insert ct;
        return acc.Id;
    }
   
}