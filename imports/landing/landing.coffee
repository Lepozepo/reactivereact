React = require "react"
ReactMixin = require "react-mixin"
_ = require "lodash"
{TrackerReactMixin} = require 'meteor/ultimatejs:tracker-react'
# Build a mixin that does deep comparisons for props and state

{div, p} = React.DOM

class mrComponent extends React.Component
	constructor: ->
		super()

		ReactMixin this, TrackerReactMixin

class ThingsList extends mrComponent
	constructor: ->
		super()
		this.subscription = Meteor.subscribe "things"

	reactive_variable: ->
		Session.get "hello"

	things: ->
		Things.find().fetch()

	render: ->
		div className:"hello",
			p {}, "Hello! #{@reactive_variable() or ""}"
			if @subscription.ready()
				# @things().map (thing,i) ->
				# 	p {key:i}, "#{thing.name}"
				@things().map (thing,i) ->
					React.createElement ThingLI,
						thing:thing
						key:i

			p {}, "more stuff"

exports.ThingsList = ThingsList

class ThingLI extends mrComponent
	constructor: ->
		super()

	render: ->
		div {className:"thingy"},
			p {}, "#{@props.thing.name}"
			@props.thing.nested.map (subthing,i) ->
				p {key:i}, subthing.name

