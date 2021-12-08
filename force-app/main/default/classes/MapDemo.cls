public class MapDemo {
    public static void mapMethodsDemo(){
        //Map<StdId,StdName>
        Map<Integer,String> stdMap = new Map<Integer,String>{7=>'Babu'};
        stdMap.put(004,'Pavan');
        stdMap.put(003,'Pavan');
        stdMap.put(001,'Sai');
        stdMap.put(002,'Mani');
        stdMap.put(005,'Krishna');
        stdMap.put(002,'Naga');
        system.debug('stdMap...'+stdMap);
        Boolean isStudentExist = stdMap.containsKey(002);
        system.debug('isStudentExist...'+isStudentExist);
        String stdName  = stdMap.get(0020);
        system.debug('stdName...'+stdName);
        //
        if(stdMap.containsKey(002)){
            String stdName1  = stdMap.get(0020);
        }
        
        Set<Integer> stdKeySet =  stdMap.keySet();
        system.debug('stdKeySet...'+stdKeySet);
        List<String> stdNameList =  stdMap.values();
        system.debug('stdNameList...'+stdNameList);
    }
}