initialize
cleanInputs: dataAndAnswerString
	"Find an remove common mistakes.  Complain when ill formed."

| fixed ddd rs places |
ddd := dataAndAnswerString.
fixed := false.

rs := ReadStream on: ddd, ' '.
places := OrderedCollection new.
[rs upToAll: '#true'.  rs atEnd] whileFalse: [places addFirst: rs position-4]. 
places do: [:pos | ddd := ddd copyReplaceFrom: pos to: pos with: ''.
	fixed := true]. 	"remove #"

rs := ReadStream on: ddd.
places := OrderedCollection new.
[rs upToAll: '#false'.  rs atEnd] whileFalse: [places addFirst: rs position-5]. 
places do: [:pos | ddd := ddd copyReplaceFrom: pos to: pos with: ''.
	fixed := true]. 	"remove #"

fixed ifTrue: [self inform: '#(true false) are Symbols, not Booleans.  
Next time use { true. false }.'].

fixed := false.
rs := ReadStream on: ddd.
places := OrderedCollection new.
[rs upToAll: '#nil'.  rs atEnd] whileFalse: [places addFirst: rs position-3]. 
places do: [:pos | ddd := ddd copyReplaceFrom: pos to: pos with: ''.
	fixed := true]. 	"remove #"

fixed ifTrue: [self inform: '#nil is a Symbol, not the authentic UndefinedObject.  
Next time use nil instead of #nil'].

^ ddd
