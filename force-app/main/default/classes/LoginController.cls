public class LoginController {
    public String userName{set;get;}
    public String password{set;get;}
    public pageReference login(){
       List<User_Logins__c> userLoginList = [Select Id,Name,Password__c from User_Logins__c where name =:userName and Password__c=:password];
        if(userLoginList.isEmpty()){
            //throw an error
            system.debug('Inside if');
            ApexPages.message msg = new ApexPages.message(ApexPages.severity.INFO,'Please check your username and password. If you still can\'t log in, contact your Salesforce administrator.');
            ApexPages.addmessage(msg);
            return null;
        }else{
            //redirect to page
            system.debug('Inside else');
            //pageReference pg = new pageReference('/apex/successLoginPage?un='+userName+'&psw='+password);
            pageReference pg = new pageReference('/apex/successLoginPage');
            pg.getParameters().put('un', userName);
            pg.getParameters().put('psw', password);
            return pg;
        }
    }
    public void updateAudit(){
        AuitUtility.updateAudit('LoginPage');        
    }
}