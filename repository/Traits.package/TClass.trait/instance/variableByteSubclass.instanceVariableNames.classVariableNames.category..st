subclass creation
variableByteSubclass: className instanceVariableNames: instvarNames 
	classVariableNames: classVarNames category: cat
	"Added to allow for a simplified subclass creation experience. "
	^self variableByteSubclass: className
		instanceVariableNames: instvarNames
		classVariableNames: classVarNames
		poolDictionaries: ''
		category: cat