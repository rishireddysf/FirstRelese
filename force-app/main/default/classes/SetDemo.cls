public class SetDemo {
    public SetDemo(){
        List<Integer> intList = new List<Integer>{1,1,2,2,10,5};
        Set<Integer> intSet = new Set<Integer>(intList);
        intSet.add(10);
        intSet.add(10);
        intSet.add(20);
        intSet.add(5);
        intSet.add(90);
         system.debug('intSet...'+intSet);
        intSet.remove(100);
    }
}