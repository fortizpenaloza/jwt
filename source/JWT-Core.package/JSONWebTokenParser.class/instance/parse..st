parsing
parse: aCompactFormattedJWT

	| parts header payload signature |

	parts := aCompactFormattedJWT splitOn: $..
	header := self base64URLDecode: parts first.
	payload := self base64URLDecode: parts second.
	signature := self base64URLDecode: parts third.

	^ JSONWebToken
		suitableFor: header
		holding: payload
		signature: signature 