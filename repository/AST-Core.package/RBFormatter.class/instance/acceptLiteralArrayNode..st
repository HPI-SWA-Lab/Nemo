visitor-double dispatching
acceptLiteralArrayNode: aRBArrayLiteralNode 
	codeStream nextPutAll: (aRBArrayLiteralNode isForByteArray 
				ifTrue: ['#[']
				ifFalse: ['#(']).
	self 
		for: aRBArrayLiteralNode contents
		do: [:each | self visitNode: each]
		separatedBy: [codeStream nextPut: $ ].
	codeStream 
		nextPut: (aRBArrayLiteralNode isForByteArray ifTrue: [$]] ifFalse: [$)])