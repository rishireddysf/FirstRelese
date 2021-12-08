public class ContactInfoClass {
    Public List<Contact> ctList {set;get;}   
    public ContactInfoClass(ApexPages.StandardController controller){
        String accRecId = controller.getId();
        system.debug('accRecId...'+accRecId);
        ctList = [Select Id,NAme From Contact where AccountId =:controller.getId()];
    }
    public void saveRecord(){
        system.debug('Inside ContactInfoClass save ');
    }
}