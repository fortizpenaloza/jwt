verify
validate: aJWS wasSignedWith: aSharedSecret

	| signature |

	signature := ((HMAC on: SHA256 new)
		key: (self encodeAsUTF8: aSharedSecret);
		digestMessage: (self encodeAsUTF8: (self signingInputFrom: aJWS)))
		asString.

	^ signature = aJWS signature