decoding
encode: aString

	| filteredChars |

	filteredChars := {Character cr. Character lf. 	$=}.

	^ ((aString base64Encoded copyReplaceAll: '+' with: '-') copyReplaceAll: '/' with: '_')
		reject: [ :char | filteredChars includes: char ]