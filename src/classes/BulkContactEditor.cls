public class BulkContactEditor {
    public Account acct {get; set;}
    public List<Contact> contacts {get; set;}
    public Set<Id> deletedContacts {get; set;}
    
    public Integer delIndex {get; set;}
    
    public BulkContactEditor(ApexPages.StandardController sc){
        sc.addFields( new List<String>{
           'name',
           'ownerid'
        });
        acct = (Account) sc.getRecord();
        deletedContacts = new Set<Id>();
        if(acct.Id != null){
            contacts = [SELECT id, FirstName, LastName, Title, Phone FROM Contact WHERE AccountId = :acct.Id ORDER BY Name];
        }else{
	        contacts = new List<Contact>();
        }       
    }
    
    public void addContact(){
        contacts.add(new Contact());
    }
    
    public void deleteContact(){
        Contact c = contacts.get(delIndex);
        if(c.Id != null)
            deletedContacts.add(c.Id);
        contacts.remove(delIndex);
    }
    
    public PageReference save(){
        Savepoint sp = Database.setSavepoint();
        try{
            upsert acct;
        	Database.delete(new List<Id>(deletedContacts));
			for(Contact c:contacts)
                c.accountId = acct.Id;
            upsert contacts;
            PageReference result = Page.ViewAccount;
            result.setRedirect(true);
            result.getParameters().put('id',acct.id);
            return result;
        }catch(System.DmlException e){
            Database.rollback(sp);
            ApexPages.addMessages(e);
        }
        return null;
    }
    
    public List<Integer> getArrayIndexes(){
        List<Integer> indexes = new List<Integer>();
        for(integer i = 0; i <= (contacts.size()-1); i++)
            indexes.add(i);
        System.debug(LoggingLevel.Error, 'Indexes: '+indexes);
        return indexes;
    }
}