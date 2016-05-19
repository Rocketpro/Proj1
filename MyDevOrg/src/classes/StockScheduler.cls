Global class StockScheduler implements Schedulable {
    
    global void execute(SchedulableContext ctx) {  
        
      database.executeBatch(new batchProjectUpdate(),50);
        
        
    }
}