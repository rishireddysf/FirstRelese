public class JSRemoteActionDemoController {
    @RemoteAction
    public static List<Account> searchAccountResults(String searchString){
        String searchStringVal = '%'+searchString+'%';
        List<Account> accList =[SELECT Id,name,accountnumber,website FROM Account WHERE Name LIKE : searchStringVal];
        system.debug('accList...'+accList);
        return accList;
    }
}