@Bistro.module "ReservationsApp", (ReservationsApp, App, Backbone, Marionette, $, _) ->
	@startWithParent = false
	
	API =
		newReservation: (reservations) ->
			ReservationsApp.New.Controller.newReservation reservations
		
		listReservations: (reservations) ->
			ReservationsApp.List.Controller.listReservations reservations
	
	ReservationsApp.on "start", ->
		reservations = App.request "reservations"
		reservations.on "add", ->
			API.newReservation reservations
		
		API.newReservation reservations
		API.listReservations reservations