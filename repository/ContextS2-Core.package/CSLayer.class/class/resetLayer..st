layers
resetLayer: aSymbol
	"Resets the global layer-instance named by aSymbol. Takes layers with their own subclass and anonymous layers into account."
	
	^ (self subclassedLayerNamed: aSymbol)
		ifNotNilDo: #resetInstance
		ifNil: [ self removeGlobalInstanceNamed: aSymbol ]