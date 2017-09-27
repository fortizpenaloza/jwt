tests
testParseJWSWithURL

	| jwsCompactSerialized jws |

	jwsCompactSerialized := 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJuYW1lIjoiZi5vcnRpekBtZXJjYXBzb2Z0d2FyZS5jb20iLCJuaWNrbmFtZSI6ImYub3J0aXoiLCJwaWN0dXJlIjoiaHR0cHM6Ly9zLmdyYXZhdGFyLmNvbS9hdmF0YXIvZjI5YzZjNDk0OTY4NTM3OTg0ZDhhNjgzZDZhMDMyNjU_cz00ODAmcj1wZyZkPWh0dHBzJTNBJTJGJTJGY2RuLmF1dGgwLmNvbSUyRmF2YXRhcnMlMkZmLnBuZyIsInVwZGF0ZWRfYXQiOiIyMDE3LTA5LTI3VDE0OjU2OjMzLjY1MVoiLCJlbWFpbCI6ImYub3J0aXpAbWVyY2Fwc29mdHdhcmUuY29tIiwiZW1haWxfdmVyaWZpZWQiOnRydWUsImlzcyI6Imh0dHBzOi8vbWVyY2FwLmF1dGgwLmNvbS8iLCJzdWIiOiJhdXRoMHw1OThiNTEwNGM1MDBlYjU5YTViNzlhYzAiLCJhdWQiOiJKUlJRNW9ZZVdxZ3ZoOXdOUm1KTWFob0s5NW5XSU8yaSIsImlhdCI6MTUwNjUyNDE5MywiZXhwIjoxNTA2NTI3NzkzfQ.JaXc-5gnGwM6oR4G7bXES1iYQcNl6C2D2zW0ywzchLU'.

	jws := JSONWebTokenParser new parse: jwsCompactSerialized.

	self
		assert: jws class equals: JWS;
		assert: jws header typ equals: 'JWT';
		assert: jws header alg equals: 'HS256';
		assert: jws payload name equals: 'f.ortiz@mercapsoftware.com';
		assert: jws payload picture equals: 'https://s.gravatar.com/avatar/f29c6c494968537984d8a683d6a03265?s=480&r=pg&d=https%3A%2F%2Fcdn.auth0.com%2Favatars%2Ff.png';
		assert: jws payload iss equals: 'https://mercap.auth0.com/';
		assert: jws payload sub equals: 'auth0|598b5104c500eb59a5b79ac0';
		assert: jws payload aud equals: 'JRRQ5oYeWqgvh9wNRmJMahoK95nWIO2i';
		assert: jws payload iat equals: 1506524193;
		assert: jws signature equals: '%¥Üæ	ÆÀÎ¨G»mqÖ&pÙz`öÍm2Ã7!-'
"		assert: jws payload exp equals: 1506527793."