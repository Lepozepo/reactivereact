React = require "react"
{render} = require "react-dom"
{ThingsList} = require "/imports/landing/landing.coffee"

Meteor.startup ->
	render React.createElement(ThingsList), document.querySelector("#react")


