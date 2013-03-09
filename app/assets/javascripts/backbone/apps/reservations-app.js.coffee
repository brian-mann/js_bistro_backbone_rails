@Bistro.module "ReservationsApp", (ReservationsApp, App, Backbone, Marionette, $, _) ->
	@startWithParent = false
	
	API =
		newReservation: ->
			ReservationsApp.New.Controller.newReservation()
	
	ReservationsApp.on "start", ->
		API.newReservation()