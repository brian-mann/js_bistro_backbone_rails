@Bistro.module "ReservationsApp", (ReservationsApp, App, Backbone, Marionette, $, _) ->
	@startWithParent = false
	
	API =
		newReservation: (reservations) ->
			ReservationsApp.New.Controller.newReservation reservations
		
		listReservations: (reservations) ->
			ReservationsApp.List.Controller.listReservations reservations
	
	ReservationsApp.on "start", (pending) ->
		pending.on "add", ->
			API.newReservation pending
		
		API.newReservation pending
		API.listReservations pending