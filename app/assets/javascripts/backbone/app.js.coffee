@Bistro = do (Backbone, Marionette) ->
	
	App = new Marionette.Application
	
	App.addRegions
		newReservationRegion: "#new-reservation-region"
		
	App.addInitializer ->
		App.module("ReservationsApp").start()
	
	App