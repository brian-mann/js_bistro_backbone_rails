@Bistro.module "ReservationsApp.New", (New, App, Backbone, Marionette, $, _) ->
	
	New.Controller = 
		
		newReservation: ->
			newView = @getNewView()
			
			App.newReservationRegion.show newView
		
		getNewView: ->
			new New.Reservation