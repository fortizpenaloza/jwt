parsing
parse: aCompactFormattedJWT

	| parts header payload signature |

	parts := aCompactFormattedJWT splitOn: $..
	header := self jsonFrom: parts first.
	payload := self jsonFrom: parts second.
	signature := self base64decode: parts third.

	^ JSONWebToken
		suitableFor: header
		holding: payload
		signature: signature 

	"	^ jws payload: (JWTClaimsSet fromJson: parts second base64Decoded) "