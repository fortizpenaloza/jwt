instance creation
suitableFor: aHeader holding: aPayload signature: aSignature

	| json klass |
	
	json := NeoJSONObject fromString: aHeader.

	klass := self subclasses
		detect: [ :class | class suitableFor: json ].

	^ klass headed: aHeader holding: aPayload signature: aSignature