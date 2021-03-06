initialize-release
superclass: sup methodDict: md format: ft name: nm organization: org instVarNames: nilOrArray classPool: pool sharedPools: poolSet 
	"Answer an instance of me, a new class, using the arguments of the 
	message as the needed information.
	Must only be sent to a new instance; else we would need Object flushCache."

	self superclass: sup.
	self methodDict: md.
	self setFormat: ft.
	self setName: nm.
	self instanceVariables: nilOrArray.
	self classPool: pool.
	self sharedPools: poolSet.
	self organization: org.