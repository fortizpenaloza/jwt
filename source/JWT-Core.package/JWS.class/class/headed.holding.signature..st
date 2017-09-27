instance creation
headed: aJOSEHeader holding: aJWSPayload signature: aSignature

	^ self new
		initializeHeaded: aJOSEHeader
		holding: aJWSPayload
		signature: aSignature