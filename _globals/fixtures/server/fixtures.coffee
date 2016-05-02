@fixtures =
	populate_things: ->
		for i in [0...100]
			Things.insert
				name:"Thing #{i}"
				nested:[
					{name:"Subthing #{i}"}
				]


