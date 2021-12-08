public class ConstrcutorDemoClass {
    Public Integer val1;
    Public Integer val2;
    Public String email;
    public ConstrcutorDemoClass(){
        system.debug('Inside ConstrcutorDemoClass');
    }
    public ConstrcutorDemoClass(Integer a, Integer b, String ctEmail){
        val1 = a;
        val2 = b;
        email = ctEmail;
    }
    
    public void addition(){
        Integer result = val1 + val2;
        system.debug('result....'+result);
    }
    
   
   
}