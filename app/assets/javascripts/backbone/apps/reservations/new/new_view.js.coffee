@Bistro.module "ReservationsApp.New", (New, App, Backbone, Marionette, $, _) ->
	
	class New.Reservation extends Marionette.ItemView
		template: "reservations/new/templates/new_reservation"
		
		ui:
			form: "form"
		
		triggers:
			"submit form" : "form:submitted"