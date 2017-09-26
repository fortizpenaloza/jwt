parsing
parse: aCompactFormattedJWT 

	| parts rawHeader header plainJWT |
	parts := aCompactFormattedJWT splitOn: $..
	
	rawHeader := parts first.
	header := NeoJSONObject fromString: (String streamContents: [ :stream |  
	Base64MimeConverter mimeDecode: rawHeader  to:  stream ]).

	^ JWT suitableFor: header.

 "̈| parts securityHeader header jws array |
	parts := aString subStrings: $..
	parts size > 1 ifTrue: [securityHeader := UTF8JSONParser parse: (GRPlatform current base64Decode: parts first).
	
	JOSEHeader for: (securityHeader at: 'alg')].
	parts size = 3 ifFalse: [Error signal: 'Mirá esto' ].
	header := JWSHeader from: UTF8JSONParser parse: (GRPlatform current base64Decode: parts first).
	jws := JSONWebSignature new
		key: 'key';
		setProtectedHeader: header.
	array := Array with:  parts first with: parts second.
	((jws signatureFor: ($. join: array)) = parts third base64Decoded asByteArray) ifFalse: [
		Error signal: 'signature does not match' ].
	^ jws payload: (JWTClaimsSet fromJson: parts second base64Decoded) "