@RestResource(urlMapping='/postconnectform/*')
global class AccountForm {   
  
    public class AccountClass{
  
        public String Name;
      
    }
  
    @HttpPOST
    global static string postFormRegistration(){
      
          try{
      
            RestRequest req = RestContext.request;
            Blob body = req.requestBody;           
            String JSONString = body.toString();
            AccountClass innerClassIns = new AccountClass();
            innerClassIns  = (AccountClass)JSON.deserialize(JSONString, AccountClass.class);
          
            if(innerClassIns  != NULL){
                Account acc =  new Account();
                acc.Name = innerClassIns.Name;
                insert acc;
            }
        }catch(Exception e){
      
        }
        return 'success';
    }
}