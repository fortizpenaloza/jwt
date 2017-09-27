parsing
base64decode: rawHeader

	^ String
		streamContents: [ :stream | Base64MimeConverter mimeDecode: rawHeader to: stream ]