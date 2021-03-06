accessing
appendPaddingToInput: input

	| paddingLength newInput |
	paddingLength := 16 - (input size \\ 16).
	newInput := input asByteArray, (ByteArray new: paddingLength withAll: paddingLength).
	newInput size \\ 16 = 0
		ifFalse: [self error: 'bad padding'].
	^ newInput
