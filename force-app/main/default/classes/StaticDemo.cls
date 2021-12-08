public class StaticDemo {
    Public static String fisrt_name;
    Public String email;
    public StaticDemo(){
        System.debug('Inside StaticDemo block');
    }
    public Integer addition(){
         Integer age = 90;
        system.debug('fisrt_name...'+fisrt_name);
        return 12+12;
    }
   
    static {
        System.debug('Inside static block');
    }
}
/*StaticDemo obj = new StaticDemo();
//obj.fisrt_name = 'Naga';
//StaticDemo.fisrt_name = 'Naga';
//Integer retVal = StaticDemo.addition();
//system.debug('retVal...'+retVal); */