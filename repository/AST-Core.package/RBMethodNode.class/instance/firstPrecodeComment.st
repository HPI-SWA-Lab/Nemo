accessing
firstPrecodeComment
	| sourceInterval  | 
	self comments ifEmpty: [ ^nil ].
	sourceInterval :=  self comments first.
	^self source copyFrom: sourceInterval first to: sourceInterval last.