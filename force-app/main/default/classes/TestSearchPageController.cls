@isTest(seeAlldata=false)
public class TestSearchPageController {
    testmethod static void testSearchAccount(){
        SearchPageController obj = new SearchPageController();
        obj.searchString = 'test';
        Test.startTest();
        obj.searchAccount();
        test.stopTest();
    }
    testmethod static void testredirectToRecord(){
        Test.startTest(); 
        SearchPageController obj = new SearchPageController();
        obj.redirectToRecord();
        Test.stopTest();
        
        test.startTest();
        obj.editRecord();
        Test.stopTest();
        
       // obj.deleteRecord();
    }

}