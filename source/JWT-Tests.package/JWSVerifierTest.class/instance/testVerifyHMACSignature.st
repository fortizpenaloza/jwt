tests
testVerifyHMACSignature

	| jws secret |
	
	self assert: (JWSVerifier verify: jws with: secret)