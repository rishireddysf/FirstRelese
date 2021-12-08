public class ScheduleBatchClassDemo implements Schedulable {
    public void execute(SchedulableContext sc){
        //BatchClassDemo obj = new BatchClassDemo();
        Database.executeBatch(new BatchClassDemo(), 10);
        
    }
}