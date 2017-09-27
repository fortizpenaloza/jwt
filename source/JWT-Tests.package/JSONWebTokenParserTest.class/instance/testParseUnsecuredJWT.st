tests
testParseUnsecuredJWT

	| jwtCompactSerialized |

	jwtCompactSerialized := 'eyJhbGciOiJub25lIn0.eyJzdWIiOiJ1c2VyMTIzIiwic2Vzc2lvbiI6ImNoNzJnc2IzMjAwMDB1ZG9jbDM2M2VvZnkiLCJuYW1lIjoiUHJldHR5IE5hbWUiLCJsYXN0cGFnZSI6Ii92aWV3cy9zZXR0aW5ncyJ9.'.

	self
		assert: (JSONWebTokenParser new parse: jwtCompactSerialized) class
		equals: UnsecuredJWT