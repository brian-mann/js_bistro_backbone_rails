@Bistro.module "ConfirmationsApp.List", (List, App, Backbone, Marionette, $, _) ->
	
	List.Controller =
		
		listConfirmations: (confirmations) ->
			listView = @getListView confirmations

			App.confirmationReservationsRegion.show listView
		
		getListView: (confirmations) ->
			new List.Confirmations
				collection: confirmations