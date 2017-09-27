verify
verify: aJWS with: aSharedSecret 

	| signature | 
	
	signature := ((SHA256 new hmac)
			key: aSharedSecret asByteArray;
			digestMessage: aJWS header asByteArray) asString.

 	^ signature = aJWS signature