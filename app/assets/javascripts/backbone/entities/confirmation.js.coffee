@Bistro.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->
	
	class Entities.Confirmation extends Entities.Model
		setReservations: (reservations) ->
			models = reservations.where confirmation_id: @id
			collection = new reservations.constructor
			collection.add models
			@set reservations: collection
		
		setAvailable: ->
			count = 0
			for reservation in @get("reservations").models
				count += reservation.get("party")			
			@set used: count
			@set available: @get("total") - count	
		
		setWidth: ->
			available = @get("used")			
			total = @get("total")
			@set width:
				Math.round parseFloat(available / total * 100)				

	class Entities.ConfirmationsCollection extends Entities.Collection
		model: Entities.Confirmation
		
	API =
		getConfirmations: (reservations) ->
			models = []
			times = [12,1,2,3,4,5,6,7,8,9,10,11]
			total = 10
			
			for i in [1..12]
				models.push
					id: i
					time: times[i-1]
					total: total
					
			confirmations = new Entities.ConfirmationsCollection models
		
			for confirmation in confirmations.models
				confirmation.setReservations reservations
				confirmation.setAvailable()
				confirmation.setWidth()
				
			confirmations
		
		getConfirmedReservations: (reservations) ->
			pending = reservations.where confirmation_id: null
			confirmed = reservations.without pending...
			new Entities.ReservationsCollection confirmed
	
	App.reqres.addHandler "confirmation:entities", (reservations) ->
		API.getConfirmations reservations
	
	App.reqres.addHandler "confirmed:reservations", (reservations) ->
		API.getConfirmedReservations reservations