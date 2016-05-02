Meteor.publish "things", ->
	Meteor._sleepForMs 2000

	Things.find()

