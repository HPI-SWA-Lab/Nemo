traits
classesComposedWithMe
	self isTrait 
		ifTrue: [ ^self users gather: [:u | u classesComposedWithMe]]
		ifFalse: [ ^{self} ].