verify
signingInputFrom: aJWS

	^ String
		streamContents: [ :stream | 
			stream
				nextPutAll: (base64URLCodec encode: (self encodeAsUTF8: aJWS header));
				nextPut: $.;
				nextPutAll: (base64URLCodec encode: aJWS payload);
				yourself ]