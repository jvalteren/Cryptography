accessing
nextBits: bitLength
	| answer extraBits |
	answer := 0.
	bitLength // 160
		timesRepeat: [answer := (answer bitShift: 160) bitOr: self nextRandom160].
	extraBits := bitLength \\ 160.
	answer := (answer bitShift: extraBits) bitOr: (self nextRandom160 bitShift: extraBits - 160).
	^ answer