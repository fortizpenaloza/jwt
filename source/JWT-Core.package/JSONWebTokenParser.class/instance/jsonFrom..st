parsing
jsonFrom: rawHeader

	^ NeoJSONObject fromString: (self base64decode: rawHeader)