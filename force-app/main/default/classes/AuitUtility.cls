public class AuitUtility {
public static void updateAudit(String page_name){
        List<Page_Audit__c> pageAuditList =[Select Id,Name,Counter__c,User__c from Page_Audit__c where Name=:page_name 
                                            and User__c =: UserInfo.getUserId()];
        if(pageAuditList.isEmpty()){
            Page_Audit__c pageAuditRec = new Page_Audit__c();
            pageAuditRec.Name  = page_name;
            pageAuditRec.Counter__c = 1;
            pageAuditRec.User__c = UserInfo.getUserId();
            insert pageAuditRec;
        }else{
            Page_Audit__c updateRec = pageAuditList[0];
            updateRec.Counter__c =  updateRec.Counter__c+1;
            update updateRec;
        }
    }
    Public static List<Schema.PicklistEntry> getPicklistValues(String objName, String fieldName){
        Map<String, String> mapPickListValues = new Map<String, String>();
        Schema.SObjectType objSobjectType = Schema.getGlobalDescribe().get(objName);
        Schema.DescribeSObjectResult objDescribeSobject = objSobjectType.getDescribe();
        Map<String, Schema.SObjectField> mapFields = objDescribeSobject.fields.getMap();
        List<Schema.PicklistEntry> lstPickListValues = mapFields.get(fieldName).getDescribe().getPickListValues();
        return lstPickListValues;
    }
}