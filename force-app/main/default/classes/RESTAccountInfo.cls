@RestResource(urlMapping='/acountInfo/*')
global class RESTAccountInfo {
    @HttpGet
    global static Account doGet() {
        RestRequest req = RestContext.request;
        system.debug('req....'+req);
        RestResponse res = RestContext.response;
        String accountId = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        Account result = [SELECT Id, Name, Phone, Website,(Select Id,Name From Contacts) FROM Account WHERE Id = :accountId];
        return result;
    }
    /*@HttpPost
global static String doPost(String name,String phone, String website,String accNumber) {
Account account = new Account();
account.Name = name;
account.phone = phone;
account.website = website;
account.AccountNumber = accNumber;
insert account;
return account.Id;
}*/
    @HttpPost
    global static ReturnInformation doPost(AccountInfo accInfo) {
        system.debug('accInfo....'+accInfo);
        ReturnInformation ret = new ReturnInformation();
        Account acc = new Account();
        acc.Name = accInfo.accName;
        acc.AccountNumber = accInfo.accNumber;
        acc.Site = accInfo.site;
        acc.Active__c = accInfo.isAccountActive;
        //Exception handling
        try{
            insert acc;
            ret.acc = acc;
            ret.isSuccess = true;
        }
        Catch(Exception e){
            ret.message = e.getMessage();
            ret.isSuccess = false;
        }
        List<Contact> ctList = new List<Contact>();
        for(ContactInfo ctRec : accInfo.ctInf){
            Contact ct = new Contact();
            ct.accountId = acc.Id;
            ct.lastname = ctRec.lastname;
            ct.firstname = ctRec.FirstName;
            ct.email = ctRec.email;
            ctList.add(ct);
            // insert ct;
        }
        try{
            insert ctList;
            ret.ctInfo = ctList;
            ret.isSuccess = true;
        }Catch(exception e){
            ret.message = e.getMessage();
            ret.isSuccess = false;
        }
        
        
        return ret;
    }
    
    global class AccountInfo{
        String accName;
        String accNumber;
        String site;
        String isAccountActive;
        List<ContactInfo> ctInf;
        
    }
    global  class ContactInfo{
        String lastName;
        String FirstName;
        String email;
        
    }
    global class ReturnInformation{
        Account acc;
        String message;
        boolean isSuccess;
        List<Contact> ctInfo;
        
    }
    
}