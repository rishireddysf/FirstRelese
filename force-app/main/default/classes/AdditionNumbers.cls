public class AdditionNumbers {
    Public Integer val1 =10;
    Public Integer val2;
    Public Integer result;
    
    Public String firstName;
    Public String lastName;
    public Integer addition(){
        result = val1 + val2;
        System.debug('Result.....'+result);
        return result;
    }
    
    public String fullName(){
        addition(12,12);
        return 'Mr.' + firstName + lastName;
        
    }
    
    Integer addition(Integer x, Integer y){
        return x + y;
    }
    
}