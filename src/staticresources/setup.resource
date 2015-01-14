Class('BulkContactEditorSetup.Class', {

    isa         : Siesta.Test.Browser,

    override : {
        
        setup : function (callback, errback) {
            console.log('stuff');
            var me = this;
            var result = sforce.apex.executeAnonymous(
                "Account a = [SELECT id, ownerId FROM Account WHERE Name = 'Burlington Textiles Corp of America']; "
                +"update new Account(Id = a.id, ownerId = UserInfo.getUserid());"
                +"delete [SELECT id FROM Contact WHERE AccountId = :a.id];"
                +"insert new List<Contact>{ "
                +" new Contact(AccountId = a.id, lastName = 'First'),"
                +" new Contact(AccountId = a.id, lastName = 'Second'),"
                +" new Contact(AccountId = a.id, lastName = 'Third')"
                +"};"
                , callback);
        }
    }
});