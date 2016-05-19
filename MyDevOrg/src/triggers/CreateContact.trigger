trigger CreateContact on Account (before insert, after insert, before update) {

List<Contact> conlist = new List<Contact>();
Contact con = new Contact();

if (trigger.isinsert)
 {
   if (trigger.isbefore)
    {
   
     for (Account acct : trigger.new)
       {

         acct.description = 'Test Description';
       }
    }
 }   
 
 
if ((trigger.isupdate) && (trigger.isbefore))
   {
   
   for (Account acc : Trigger.new)
    {
    
    Account oldAcc = Trigger.oldmap.get(acc.id);
    
    if (oldAcc.Industry != acc.Industry)
      {
       acc.website = 'www.test.com';
      }
    }
    
   }   



 if (trigger.isinsert)
    {
      if (trigger.isafter)
      {
        for (Account acct : trigger.new)
          {

            con.Lastname = 'Test Last Name 1';
            con.accountid = acct.id;
   
            conlist.add(con);
            system.debug (con);
         }
         insert conlist;
       }
   }
}