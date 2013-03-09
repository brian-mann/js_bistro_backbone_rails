@Bistro.module "ReservationsApp.List", (List, App, Backbone, Marionette, $, _) ->
	
	List.Controller = 
		
		listReservations: (reservations) ->
			listView = @getListView reservations
			
			listView.on "itemview:has:been:confirmed", (iv, pending) ->
				reservations.remove pending
				# App.vent.trigger "pending:confirmed", pending
			
			App.listReservationsRegion.show listView
		
		getListView: (reservations) ->
			new List.Pendings
				collection: reservations