global class batchProjectUpdate implements Database.Batchable<sObject> {
    
    global Database.QueryLocator start(Database.BatchableContext BC) {    
       
        String query = 'SELECT Id, Name, TickerSymbol, stock_value__c  FROM Account WHERE TickerSymbol != \'\' ORDER By Name';                
        return Database.getQueryLocator(query);
    }
   
    global void execute(Database.BatchableContext BC, List<Account> scope) {    
            
        for(Account a : scope){
        
//         a.Name = a.Name + 'Updated';   
         WebserviceClass web = new WebserviceClass();
         String Price1;
         Price1 = WebserviceClass.setTickerValues(a.TickerSymbol);
        
         System.debug ('::: Price is ' +Price1);  
         
         a.stock_value__c = Integer.valueOf(Price1);
         
         System.debug ('::: stock_value__c is ' +a.stock_value__c);         
         System.debug ('::: stock_value__c is - ' +a.stock_value__c);         
         
              
        }
         update scope;
    }   
    
    global void finish(Database.BatchableContext BC) {
            
        System.debug('::::finish::');
    }
}