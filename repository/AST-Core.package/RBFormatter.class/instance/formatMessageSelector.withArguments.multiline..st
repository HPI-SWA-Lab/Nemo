private-formatting
formatMessageSelector: selectorParts withArguments: formattedArgs multiline: multiLine 
	formattedArgs isEmpty 
		ifTrue: [codeStream nextPutAll: selectorParts first value]
		ifFalse: 
			[1 to: formattedArgs size
				do: 
					[:i | 
					(i ~= 1 and: [ multiLine not ])
						ifTrue: [codeStream nextPut: $ ].
					codeStream 
						nextPutAll: (selectorParts at: i) value;
						nextPut: $ ;
						nextPutAll: (formattedArgs at: i).
					(multiLine and: [i < formattedArgs size]) ifTrue: [self indent]]]