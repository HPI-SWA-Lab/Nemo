adding/removing methods
addSelectorSilently: selector withMethod: compiledMethod
	self methodDictAddSelectorSilently: selector withMethod: compiledMethod.
	self registerLocalSelector: selector.
	self isTrait ifTrue: [ self notifyUsersOfChangedSelector: selector].