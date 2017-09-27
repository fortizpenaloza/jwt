instance creation
suitableFor: aHeader holding: aPayload signature: anObject

	| klass |

	klass := self subclasses
		detect: [ :class | class suitableFor: aHeader ].

	^ klass headed: aHeader holding: aPayload signature: nil