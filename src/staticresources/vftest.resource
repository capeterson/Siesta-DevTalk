StartTest(function(t){
    
    t.it('Should display error message when data is missing', function(t) {
        t.chain(
            { click : "[data-tid='input-accountName']" },
        
            { type : "New Account - for testing[RETURN]" },
            
            { waitFor : "PageLoad" },
        
            { waitForTextPresent : "Account Owner: You must enter a value" }
        );
    });
        
    t.it('Should not display error message after saving valid data', function(t) {
        t.chain(
            { click : "[data-tid='input-accountOwner']" },
            
            { type: 'Chris Peterson[RETURN]' },
            
            { waitFor : "PageLoad" },
    
            { waitForTextNotPresent : "Account Owner: You must enter a value" }
        );
    });
    
    t.it('Should create three new contacts named Bob', function(t){
    	t.chain(
            { click : "[data-tid='newContact']"},
                
            { waitFor : "ElementNotVisible", args : "#el_loading" },
            
            { click : "[data-tid='row0-firstName']" },
        
            { action : "type", options : { shiftKey : true }, text : "Bob" },
        
            { click : "[data-tid='row0-lastName']", offset : [21, 9] },
        
            { action : "type", options : { shiftKey : true }, text : "Dole" },
        
            { click : "[data-tid='row0-title']", offset : [96, 8] },
        
            { action : "type", options : { shiftKey : true }, text : "Vice President" },
        
            { click : "[data-tid='newContact']", offset : [64, 13] },
                
            { waitFor : "ElementNotVisible", args : "#el_loading" },
        
            { click : "[data-tid='row1-firstName']", offset : [43, 12] },
        
            { action : "type", options : { shiftKey : true }, text : "Bob" },
        
            { click : "[data-tid='row1-lastName']", offset : [16, 8], by : [0, 1] },
        
            { action : "type", options : { shiftKey : true }, text : "Marley" },
        
            { click : "[data-tid='newContact']", offset : [42, 6] },
            
            { waitFor : "ElementNotVisible", args : "#el_loading" },
        
            { click : "[data-tid='row2-firstName']", offset : [113, 9] },
        
            { action : "type", options : { shiftKey : true }, text : "Bob" },
        
            { click : "[data-tid='row2-lastName']", offset : [62, 9], by : [0, 1] },
        
            { action : "type", options : { shiftKey : true }, text : "Dyllan" },
        
            { click : "[data-tid='save']", offset : [26, 19] },
        
            { waitFor : "PageLoad", args : [] } 
		);
    });
});