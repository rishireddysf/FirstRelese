public class DMLMultiInsert {
    public DMLMultiInsert(){
        List<Account> accInsertList = new List<Account>();
        for(Integer i = 0; i<220;i++){
         accInsertList.add(new Account(Name='Test'+i,AccountNumber='Test12333'+i));
        }
        insert accInsertList;
    }
}