accessing instances and variables
allInstances
	"Answer a collection of all current instances of the receiver."

	| all inst next |
	all := OrderedCollection new.
	inst := self someInstance.
	[inst == nil]
		whileFalse: [
		next := inst nextInstance.
		inst == all ifFalse: [all add: inst].
		inst := next].
	^ all asArray