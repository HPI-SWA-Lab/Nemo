private
privateAt: aKey put: aValue
	tally = keys size ifTrue: [ self grow ].
	keys at: (tally := tally + 1) put: aKey.
	^ values at: tally put: aValue