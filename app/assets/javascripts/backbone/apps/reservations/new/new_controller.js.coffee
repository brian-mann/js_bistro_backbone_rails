@Bistro.module "ReservationsApp.New", (New, App, Backbone, Marionette, $, _) ->
	
	New.Controller = 
		
		newReservation: (reservations) ->
			reservation = App.request "new:reservation", reservations
				
			newView = @getNewView reservation, reservations
			
			newView.on "form:submitted", ->
				data = Backbone.Syphon.serialize newView
				reservation.processForm data, reservations
			
			App.newReservationRegion.show newView
		
		getNewView: (reservation, reservations) ->
			new New.Reservation
				model: reservation
				collection: reservations