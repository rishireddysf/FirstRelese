public class DynamicApexDemoController {
    public List<SelectOption> onbordingList ;
    public String selectedStatus {set;get;}
    Public DynamicApexDemoController(){
        //selectedStatus = 'New';
        String query = 'Select Id,Name From Account ';
        if(selectedStatus !=null){
            query = query +'Where On_Boarding_Status__c =\''+selectedStatus+'\'';
        }
        system.debug('query.....'+query);
        List<Account> accList = database.query(query);
    }
    public List<SelectOption> getOnbordingList(){
        onbordingList =  new List<SelectOption>();
        /*onbordingList.add(new SelectOption('','--None--'));
        onbordingList.add(new SelectOption('New','New'));
        onbordingList.add(new SelectOption('Pending','Pending'));
        onbordingList.add(new SelectOption('Complete','Complete'));*/
        
        
        /*Map<String, String> mapPickListValues = new Map<String, String>();
        Schema.SObjectType objSobjectType = Schema.getGlobalDescribe().get('Account');
        Schema.DescribeSObjectResult objDescribeSobject = objSobjectType.getDescribe();
        Map<String, Schema.SObjectField> mapFields = objDescribeSobject.fields.getMap();
        List<Schema.PicklistEntry> lstPickListValues = mapFields.get('On_Boarding_Status__c').getDescribe().getPickListValues();*/
        //List<Schema.PicklistEntry> lstPickListValues = AuitUtility.getPicklistValues('Account','On_Boarding_Status__c');
        for (Schema.PicklistEntry objPickList : AuitUtility.getPicklistValues('Account','On_Boarding_Status__c')) {
            System.debug('Value = ' +objPickList.getValue() +' , Label = ' +objPickList.getLabel());
            onbordingList.add(new SelectOption(objPickList.getValue(),objPickList.getLabel()));
        }
        
        return onbordingList;
    }
}