stream - api
nextLength

	| tag val |
	tag := self stream next.
	tag = 2r10000000 
		ifTrue: [^ -1].
	((tag bitAnd: 2r10000000) > 0)
		ifTrue: [
			val := 0.
			(tag bitClear: 2r10000000) timesRepeat: [
				val := (val bitShift: 8) + self stream next].
			^ val]
		ifFalse: [^ tag].
