@Bistro.module "ReservationsApp.New", (New, App, Backbone, Marionette, $, _) ->
	
	New.Controller = 
		
		newReservation: ->
			reservations = App.request "reservations"
			reservation = App.request "new:reservation", reservations
			newView = @getNewView reservation
			
			App.newReservationRegion.show newView
		
		getNewView: (reservation) ->
			new New.Reservation
				model: reservation