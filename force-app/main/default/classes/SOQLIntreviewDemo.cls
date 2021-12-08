public class SOQLIntreviewDemo {
    public static void scenario1(){
        List<Account> accList = new List<Account>();
        accList = [Select Id,Name From Account];
        String name = accList[0].Name;
        
    }
    public static void scenario2(){
        List<Account> accList = [Select Id,Name From Account where name ='asdasdasdad'];
        // String name = accList1[0].Name;
        Integer count = accList.size();
        List<Opportunity> oppList = [select id,Name,StageName,IsWon,IsClosed,Amount from Opportunity];
        List<String> oppNameList = new List<String>();
        List<String> wonOppNameList = new List<String>();
        List<Opportunity> wonOppNameList1 = [select id,Name,StageName,IsWon,IsClosed,Amount from Opportunity where (StageName = 'Closed Won' or IsWon=true)];
        List<String> lostOppNameList = new List<String>();
        List<String> runningOppNameList = new List<String>();
        List<String> closedOppNameList = new List<String>();
        List<String> largeOppAmountNameList = new List<String>();
        
        for(Opportunity oppRec : oppList){
            oppNameList.add(oppRec.Name);
            /*if(oppRec.StageName == 'Closed Won'){
                wonOppNameList.add(oppRec.Name);
            }*/
            if(oppRec.IsWon){
                wonOppNameList.add(oppRec.Name);
            }
            if(oppRec.StageName == 'Closed Lost'){
                lostOppNameList.add(oppRec.Name);
            }
            /*if(oppRec.StageName != 'Closed Won' || oppRec.StageName != 'Closed Lost'){
                runningOppNameList.add(oppRec.Name);
            }*/
             if(!oppRec.IsClosed){
                runningOppNameList.add(oppRec.Name);
            }
           /* if(oppRec.StageName == 'Closed Won' || oppRec.StageName == 'Closed Lost'){
                closedOppNameList.add(oppRec.Name);
            }
            if(oppRec.IsClosed){
                closedOppNameList.add(oppRec.Name);
            }*/
            closedOppNameList.addAll(wonOppNameList);
            closedOppNameList.addAll(lostOppNameList);
            if(oppRec.Amount > 5000){
                largeOppAmountNameList.add(oppRec.Name);
            }
        }
    }
    
}