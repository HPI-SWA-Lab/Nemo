private-parsing
parseUnaryPragma
	| selector |
	selector := currentToken.
	self step.
	^ self pragmaNodeClass selectorParts: (Array with: selector) arguments: #()