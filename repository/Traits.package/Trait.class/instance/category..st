accessing
category: aString 
	"Categorize the receiver under the system category, aString, removing it from 
	any previous categorization."

	| oldCategory |
	oldCategory := category.
	aString isString
		ifTrue: [
			category := aString asSymbol.
			SystemOrganization classify: self name under: category ]
		ifFalse: [self errorCategoryName].
	SystemChangeNotifier uniqueInstance
		class: self recategorizedFrom: oldCategory to: category