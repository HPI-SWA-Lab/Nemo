remote
call: aMethodReference forkedOn: aReceiver
	| remoteResult remoteTask |
	remoteTask := RemoteTask new
		task: [ self call: aMethodReference on: aReceiver ];
		yourself.
	remoteResult := remoteTask value.
	remoteResult isString
		ifTrue: [ (remoteResult beginsWith: 'remote task execution failed')
			ifTrue: [ Transcript cr; show: remoteResult. 
				^ nil ] ].	
	^ remoteResult.
	