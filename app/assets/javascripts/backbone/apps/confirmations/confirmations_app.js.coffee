@Bistro.module "ConfirmationsApp", (ConfirmationsApp, App, Backbone, Marionette, $, _) ->
	@startWithParent = false
	
	API =
		
		listConfirmations: (confirmations) ->
			ConfirmationsApp.List.Controller.listConfirmations confirmations
	
	ConfirmationsApp.on "start", (confirmed) ->
		ConfirmationsApp.confirmations = App.request "confirmation:entities", confirmed
		API.listConfirmations ConfirmationsApp.confirmations
	
	App.vent.on "pending:confirmed", (pending) ->
		confirmation_id = pending.get("confirmation_id")
		console.log "pending", confirmation_id
		ConfirmationsApp.confirmations.get(confirmation_id).get("reservations").add(pending)