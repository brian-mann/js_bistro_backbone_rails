@Bistro = do (Backbone, Marionette) ->
	
	App = new Marionette.Application
	
	App.on "initialize:before", ->
		@reservations = App.request "reservation:entities"
	
	App.reqres.addHandler "reservations", ->
		App.reservations
	
	App.addRegions
		newReservationRegion: 					"#new-reservation-region"
		listReservationsRegion: 				"#list-reservations-region"
		confirmationReservationsRegion: "#confirmed-reservations-region"
		
	App.addInitializer ->
		@reservations.on "reset", (collection) ->
			pending 	= App.request "pending:reservations", collection
			confirmed = App.request "confirmed:reservations", collection
			
			App.module("ReservationsApp").start pending
			App.module("ConfirmationsApp").start confirmed
	
	App.on "initialize:after", (options) ->
		if Backbone.history
			Backbone.history.start()
	
	App