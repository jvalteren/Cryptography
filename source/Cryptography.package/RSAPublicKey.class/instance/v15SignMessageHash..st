process
v15SignMessageHash: encodedMsg

	| padded toBeSigned |
	padded := ByteArray new: (256 - encodedMsg size - 3) withAll: 255.
	toBeSigned := #(0) asByteArray, #(1) asByteArray, padded, #(0) asByteArray, encodedMsg.
	^ (self crypt: toBeSigned asInteger) asByteArray.
