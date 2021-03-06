private-parsing
parseCascadeMessage
	| node receiver messages semicolons |
	node := self parseKeywordMessage.
	(currentToken isSpecial 
		and: [currentToken value = $; and: [node isMessage]]) ifFalse: [^node].
	receiver := node receiver.
	messages := OrderedCollection new: 3.
	semicolons := OrderedCollection new: 3.
	messages add: node.
	[currentToken isSpecial and: [currentToken value = $;]] whileTrue: 
			[semicolons add: currentToken start.
			self step.
			messages add: (currentToken isIdentifier 
						ifTrue: [self parseUnaryMessageWith: receiver]
						ifFalse: 
							[currentToken isKeyword 
								ifTrue: [self parseKeywordMessageWith: receiver]
								ifFalse: 
									[| temp |
									currentToken isLiteralToken ifTrue: [self patchNegativeLiteral].
									currentToken isBinary ifFalse: [ ^ self parserError: 'Message expected'].
									temp := self parseBinaryMessageWith: receiver.
									temp == receiver ifTrue: [ ^ self parserError: 'Message expected'].
									temp]])].
	^self cascadeNodeClass messages: messages semicolons: semicolons