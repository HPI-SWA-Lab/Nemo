testing
isObsolete
	"Return true if the receiver is obsolete."
	^(self environment at: self name ifAbsent: [nil]) ~~ self