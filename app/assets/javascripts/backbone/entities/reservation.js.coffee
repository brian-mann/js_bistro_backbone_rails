@Bistro.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->
	
	class Entities.Reservation extends Entities.Model

	class Entities.ReservationsCollection extends Entities.Model
		model: Entities.Reservation
		url: -> Routes.reservations_path()
	
	API =
		getReservations: ->
			reservations = new Entities.ReservationsCollection
			reservations.fetch()
			reservations
	
	App.reqres.addHandler "reservation:entities", ->
		API.getReservations()