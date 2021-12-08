public class ListCollectionDemo {
    Public Integer val1=10;
    Public Integer val2=20;
    Public Integer val3=30;
    Public Integer val4=40;
    Public Integer val5=50;
    
    public ListCollectionDemo(){
        List<Integer> intList = new List<Integer>{90,80};
            intList.add(val1);
        intList.add(val2);
        intList.add(val3);
        intList.add(val4);
        intList.add(val5);
        intList.add(60);
        system.debug('intList...'+intList);
        List<Integer> intList1 =  new List<Integer>{1,2};
            intList1 = intList;
        system.debug('intList1...'+intList1);
        
        List<Integer> intList2 = new List<Integer>{200,300};
            intList2.addAll(intList) ;
        system.debug('before intList2..'+intList2);
        intList.add(100);
        intList2.addAll(intList) ;
        system.debug('after intList2..'+intList2.size());
        
        List<Integer> intList3 =  new List<Integer>(intList);
        intList3.add(500);
    }
    Public static void testEqual(){
        List<Integer> intList = new List<Integer>{1,2,3};
            List<Integer> intList1 = new List<Integer>{1,2,3,4};
                System.debug(intList.equals(intList1));
    }
    
}