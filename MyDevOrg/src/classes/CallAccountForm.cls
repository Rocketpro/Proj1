global class CallAccountForm {  
  
    Webservice static void callAccountInsert(){
        
        HTTP ins = new HTTP();
        HttpRequest req = new HttpRequest();
        HttpResponse res = new HttpResponse();             
        
        req.setBody('{"Name":"TestBesantAcc1"}');
        req.setMethod('POST');
        req.setHeader('Content-Type', 'application/json'); 
        req.setHeader('Authorization','Bearer 00D15000000NJA0!AQgAQAaFV86w7iCZHgOuxBYctfOznIww1nMjV94mOof918IXKnLpuuyBUvUOCrxp1mQhnpxuHKxr2UaIpBtYnImhXsE676Zo');
        req.setEndPoint('https://na22.salesforce.com/services/apexrest/postconnectform/');
        res = ins.send(req);       
    }
}