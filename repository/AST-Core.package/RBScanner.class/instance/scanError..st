private-scanning
scanError: theCause
	currentCharacter ifNotNil: [ :char | buffer nextPut: char ].
	^ RBErrorToken
		value: buffer contents asString
		start: tokenStart
		cause: theCause
		location: stream position + 1