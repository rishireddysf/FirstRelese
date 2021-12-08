public  class SearchPageController {
    @TestVisible
    private String searchString{set;get;}
    public String selectedRecordId {set;get;}
    Public String selectedAccNum{set;get;}
    public String selectedEditRecordId{set;get;}
    public String selectedDelRecordId{set;get;}
    Public List<Account> accList {set;get;}
    Public Boolean isRecordsExists {set;get;}
    public void searchAccount(){
       /* system.debug('inside searchAccount'+searchString);
        //String str = '%'+searchString+'%';
        accList = [Select Id,Name,AccountNumber	 From Account where name like : '%'+searchString+'%' ];*/
        AccountSelectorDemo obj = new AccountSelectorDemo();
        accList = obj.searchAccount(searchString);
        system.debug('accList...'+accList);
        isRecordsExists = accList.isEmpty();
    }
    public Pagereference redirectToRecord(){
        system.debug('inside redirectToRecord'+selectedRecordId);
        system.debug('inside redirectToRecord'+selectedAccNum);
        Pagereference pr = new Pagereference('/'+selectedRecordId);
        return pr;
    }
    public Pagereference editRecord(){
        Pagereference pr = new Pagereference('/'+selectedEditRecordId+'/e');
        return pr;
    }
    public Pagereference deleteRecord(){
        Account acc = new Account(Id=selectedDelRecordId);
        if (!Account.sObjectType.getDescribe().isDeletable()){
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,
                                                       'Insufficient access.....................'));
            return null;
        }
        delete acc;
        searchAccount();
        return null;
    }
    class  AccountSelectorDemo{
        public List<Account> searchAccount(String searchString){
            return [Select Id,Name,AccountNumber	 From Account where name like : '%'+searchString+'%' ];
        }
    }
}