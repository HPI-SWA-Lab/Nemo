private
becomeCompact
	"Make me compact.
	This means: 
	- find a free slot in 'Smalltalk compactClassArray'
	- add me in that array
	- update my format with the index
	- update my instances
	"

	self classBuilder becomeCompact: self