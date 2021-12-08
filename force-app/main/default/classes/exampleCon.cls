public class exampleCon {
    Integer count = 0;
       public PageReference incrementCounter() {
            count++;
            return null;
    }
    public exampleCon(){
        
    }     
    public void updateAudit(){
        
        AuitUtility.updateAudit('ActionPollerDemoPage');        
    }
    public Integer getCount() {
        system.debug('inside getter');
        return count;
    }
}