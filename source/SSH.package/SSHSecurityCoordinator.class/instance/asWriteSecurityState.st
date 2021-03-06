conn states
asWriteSecurityState

	| connState |
	connState := SSHWriteConnectionState newOnConnection: self connection.
	connState
		compressionState: (self compressionAlgorithmStateOn: connState);
		cipherState: (self bulkCipherAlgorithmStateOn: connState);
		macState: (self macAlgorithmStateOn: connState);
		packagerState: (self packagerAlgorithmStateOn: connState);
		yourself.
	^ connState