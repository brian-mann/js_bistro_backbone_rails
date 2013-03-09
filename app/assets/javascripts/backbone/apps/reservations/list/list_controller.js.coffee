@Bistro.module "ReservationsApp.List", (List, App, Backbone, Marionette, $, _) ->
	
	List.Controller = 
		
		listReservations: (reservations) ->			
			listView = @getListView reservations
			
			App.listReservationsRegion.show listView
		
		getListView: (reservations) ->
			new List.Pendings
				collection: reservations