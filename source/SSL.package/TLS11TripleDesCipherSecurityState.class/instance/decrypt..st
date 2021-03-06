as yet unclassified
decrypt: data

	| cipher encryptedStream block decryptedStream decrypted paddingLength fragmentLength |
	encryptedStream := data fragment readStream.
	decryptedStream := ReadWriteStream on: (ByteArray new: encryptedStream size).
	[encryptedStream atEnd] whileFalse: 
		[block := encryptedStream next: 8.
		tripleDes decryptBlock: block.
		decryptedStream nextPutAll: block].
	decrypted := decryptedStream contents.

	paddingLength := decrypted last.
	(paddingLength > (decrypted size - self hashSize - 1))
		ifTrue: [^ self sendAlertCode: 20].
	fragmentLength := decrypted size - self hashSize - paddingLength - 1.
	decryptedStream := decrypted readStream.
	cipher := SSLBlockCipher new
		content: (decryptedStream next: fragmentLength);
		mac: (decryptedStream next: self hashSize);
		padding: (decryptedStream next: paddingLength);
		paddingLength: paddingLength;
		yourself.
	data fragment: cipher.

	^ SSLCompressedWithMAC new
		type: data type;
		version: data version;
		length: cipher content size;
		fragment: cipher content;
		mac: cipher mac;
		yourself
