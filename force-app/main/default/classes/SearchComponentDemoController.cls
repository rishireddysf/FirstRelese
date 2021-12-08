public class SearchComponentDemoController {
    @RemoteAction
    public static List<sObject> getAccount(String searchString,String objectName,String fieldAPIs){
        system.debug('searchString...'+searchString);
        String sObjectName = (objectName == null) ? 'Account' : String.escapeSingleQuotes( objectName );
        //String accountNameVal = '%'+accountName+'%';
        String query = 'Select ID, Name,'+fieldAPIs+' from ' +sObjectName+'  where Name like \'%' + searchString  + '%\'';
        //String query = 'Select Id,Name from '+sObjectName+ ' where name like :'+accountNameVal;
        system.debug('query...'+query);
        return database.query(query);
    }
    
}