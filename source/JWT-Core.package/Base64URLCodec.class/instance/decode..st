decoding
decode: anEncodedString

	^ ((anEncodedString copyReplaceAll: '-' with: '+') copyReplaceAll: '_' with: '/') base64Decoded