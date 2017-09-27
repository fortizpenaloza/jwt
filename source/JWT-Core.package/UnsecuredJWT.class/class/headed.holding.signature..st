instance creation
headed: aJOSEHeader holding: aPayload signature: aSignature

	^ self new
		initializeHeaded: aJOSEHeader
		holding: aPayload
		signature: nil