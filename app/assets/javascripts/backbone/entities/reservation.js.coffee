@Bistro.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->
	
	class Entities.Reservation extends Entities.Model
		url: -> Routes.reservations_path()

	class Entities.ReservationsCollection extends Entities.Collection
		model: Entities.Reservation
		url: -> Routes.reservations_path()
		comparator: (model) ->
			-model.get "created_at_int"
	
	API =
		getReservations: ->
			reservations = new Entities.ReservationsCollection
			reservations.fetch()
			reservations
		
		newReservations: (reservations) ->
			new reservations.model
	
	App.reqres.addHandler "reservation:entities", ->
		API.getReservations()
	
	App.reqres.addHandler "new:reservation", (reservations) ->
		API.newReservations reservations