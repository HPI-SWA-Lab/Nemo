private-parsing
parsePatternBlock: aClass 
	| position node |
	position := currentToken start.
	self step.
	node := self parseBlockArgsInto: aClass new.
	node left: position.
	
	node body: self sequenceNodeClass new.
	(self parseStatements: false into: node body).
	
	(currentToken isSpecial and: [currentToken value = $}]) 
		ifFalse: [ ^ self parserError: '''}'' expected'].
	node right: currentToken start.
	self step.
	^node