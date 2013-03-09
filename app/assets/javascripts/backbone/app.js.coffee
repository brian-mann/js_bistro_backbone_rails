@Bistro = do (Backbone, Marionette) ->
	
	App = new Marionette.Application
	
	App.on "initialize:before", ->
		@reservations = App.request "reservation:entities"
	
	App.reqres.addHandler "reservations", ->
		App.reservations
	
	App.addRegions
		newReservationRegion: "#new-reservation-region"
		
	App.addInitializer ->
		App.module("ReservationsApp").start()
	
	App.on "initialize:after", (options) ->
		if Backbone.history
			Backbone.history.start()
	
	App