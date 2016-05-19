global with sharing class WebServiceClass{
 
    webservice static String setTickerValues(String ticker){
   
           HTTP http = new HTTP();
           HTTPRequest req = new HTTPRequest();
           HTTPResponse res = new HTTPResponse();  
           
           req.setTimeOut(60000);            
           req.setEndpoint('http://download.finance.yahoo.com/d/quotes.csv?s='+ticker+'&f=sl1');          
           req.setMethod('GET'); 
           
           res = http.send(req);
            
            System.debug('::'+res+'::'+res.getBody());
           String resVar = res.getBody();
                  
           resVar = resVar.replaceAll('\r\n', '').replaceAll('"','');            
           List<String> tickerAndCurrentPriceArray = new List<String>();
           if(String.isNotBlank(resVar)){
               tickerAndCurrentPriceArray = resVar.split(',');
           }
           System.debug('::tickerAndCurrentPriceArray:;'+tickerAndCurrentPriceArray);
           String price;
           if(tickerAndCurrentPriceArray.size() >= 2){
               
               price  = tickerAndCurrentPriceArray[1]; 
           }              
           return price;
       }
}