error handling
parseErrorNode: aMessageString
	| token sourceString |
	currentToken isError ifTrue: [ ^ RBParseErrorNode errorMessage: currentToken cause token: currentToken ].
	sourceString := source copyFrom: self errorPosition to: source size.
	token := RBValueToken value: sourceString start: self errorPosition.
	^ RBParseErrorNode
		errorMessage: aMessageString token: token