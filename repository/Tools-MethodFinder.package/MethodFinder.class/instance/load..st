initialize
load: dataWithAnswers
	"Find a function that takes the data and gives the answers.  Odd list entries are data for it, even ones are the answers.  nil input means data and answers were supplied already."
"  (MethodFinder new) load: #( (4 3) 7  (-10 5) -5  (-3 11) 8);
		findMessage  "

self loadBasic: dataWithAnswers.	"sets data and answers"
argMap _ (1 to: data first size) asArray.
data do: [:list | list size = argMap size ifFalse: [
		self inform: 'data arrays must all be the same size']].
argMap size > 4 ifTrue: [self inform: 'No more than a receiver and 
three arguments allowed'].
	"Really only test receiver and three args." 
thisData _ data copy.
mapStage _ mapList _ nil.
