@Bistro.module "ReservationsApp.New", (New, App, Backbone, Marionette, $, _) ->
	
	class New.Reservation extends Marionette.ItemView
		template: "reservations/new/templates/new_reservation"
		
		ui:
			form: "form"
		
		events:
			"submit form" : "formSubmitted"
		
		formSubmitted: (e) ->
			e.preventDefault()
			data = Backbone.Syphon.serialize @
			console.log data