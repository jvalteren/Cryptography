class initialization
initialize
	super initialize.
	Smalltalk 
		addToStartUpList: self ;
		addToShutDownList: self.
	self startUp