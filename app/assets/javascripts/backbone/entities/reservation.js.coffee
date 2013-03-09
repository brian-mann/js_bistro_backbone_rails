@Bistro.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->
	
	class Entities.Reservation extends Entities.Model
		urlRoot: -> Routes.reservations_path()

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
		
		newReservation: (reservations) ->
			new Entities.Reservation
		
		getPendingReservations: (reservations) ->
			pending = reservations.where confirmation_id: null
			new Entities.ReservationsCollection pending
	
	App.reqres.addHandler "reservation:entities", ->
		API.getReservations()
	
	App.reqres.addHandler "new:reservation", (reservations) ->
		API.newReservation reservations
	
	App.reqres.addHandler "pending:reservations", (reservations) ->
		API.getPendingReservations reservations