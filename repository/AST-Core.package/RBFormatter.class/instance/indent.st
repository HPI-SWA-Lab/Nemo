private
indent
	firstLineLength isNil ifTrue: [firstLineLength := codeStream position].
	codeStream cr.
	tabs timesRepeat: [codeStream tab].
	lineStart := codeStream position