serialization
serializeCompact

	| encoder |

	encoder := [ :stringToEncode | ((stringToEncode base64Encoded copyReplaceAll: '+' with: '-') copyReplaceAll: '/' with: '_') reject: [ :char | (String with: Character cr with: Character lf with: $=) includes: char ]  ].
	
	^ '<1s>.<2s>.<3s>'
		expandMacrosWith: (encoder value: header) 
		with: (encoder value: payload) 
		with: (encoder value: signature)