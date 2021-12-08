public class SuccessLoginPageController {
    Public String userName {set;get;}
    Public String psw {set;get;}
    public SuccessLoginPageController(){
     userName = Apexpages.currentpage().getparameters().get('un');
     psw = Apexpages.currentpage().getparameters().get('psw');
        system.debug('Apexpages.currentpage()...'+Apexpages.currentpage());
    }
}