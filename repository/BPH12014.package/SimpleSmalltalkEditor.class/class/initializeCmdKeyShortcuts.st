as yet unclassified
initializeCmdKeyShortcuts
	super initializeCmdKeyShortcuts.
	cmdActions at: $g asciiValue + 1 put: #guessIt:.
	cmdActions at: $h asciiValue + 1 put: #openMethodFinder:.
	cmdActions at: $j asciiValue + 1 put: #openFancyUi:.
	
	cmdActions at: 27 + 1 put: #noop:

	"self initialize"