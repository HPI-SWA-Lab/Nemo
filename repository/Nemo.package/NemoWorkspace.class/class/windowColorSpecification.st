spec
windowColorSpecification
	"Answer a WindowColorSpec object that declares my preference"

	^ WindowColorSpec
		classSymbol: self name
		wording: 'Nemo Workspace'
		brightColor: #lightGreen
		pastelColor: #paleGreen
		normalColor: (Color r: 0.525 g: 0.688 b: 0.449)
		helpMessage: 'A cooler workspace.'