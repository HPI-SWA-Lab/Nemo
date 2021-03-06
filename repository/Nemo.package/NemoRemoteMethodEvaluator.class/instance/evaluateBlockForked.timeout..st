remote
evaluateBlockForked: aBlock timeout: aNumber
	| remoteResult remoteTask sandboxedTask semaphore |
	sandboxedTask :=  [
		NemoRemoteSecurityManager forceSandbox.
		aBlock value ].
	semaphore := Semaphore new.
	remoteResult := nil.
	remoteTask := RemoteTask
			do: sandboxedTask
			whenComplete: [ :result |
				remoteResult := result.
				semaphore signal ].
	(semaphore waitTimeoutMSecs: aNumber)
		ifTrue: [
			Transcript cr; show: 'remote task timed out'.
			remoteTask finalize.
			^ nil ].
	^ (self processFailureResult: remoteResult)
		ifTrue: [ nil ]
		ifFalse: [ remoteResult ]