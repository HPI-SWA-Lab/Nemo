search
findMessage
	"Launch a search for expressions that compute the answers.  Return just the expressions sorted."

	data do: [:alist |
		alist isSequenceable ifFalse: [
			^ OrderedCollection with: 'first and third items are not Arrays']].
	Approved ifNil: [self initialize].	"Sets of allowed selectors"
	resultsList := OrderedCollection new.
	self search: true.	"multi"
	resultsList isEmpty & (noMoreRecursion == nil) ifTrue: [
		noMoreRecursion := true.
		resultsList := (MethodFinderStage2 new loadData: data answers: answers) searchForOne ].
	resultsList isEmpty ifTrue: [^ OrderedCollection with: 'no single method does that function'].
	"resultsList isString ifTrue: [^ OrderedCollection with: resultsList]."
	noMoreRecursion := nil.	"allow next time"
 	^ self sortedExpressions