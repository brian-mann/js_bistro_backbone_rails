@Bistro.module "ConfirmationsApp.List", (List, App, Backbone, Marionette, $, _) ->
	
	class List.Confirmation extends Marionette.ItemView
		template: "confirmations/list/templates/_confirmation"
		
		ui:
			confirmation: ".confirmation-item"
		
		initialize: ->
			@listenTo @model.get("reservations"), "add", "pendingAdded"
			
		pendingAdded: ->
			console.log "pendingAdded"
			@render()
		
		onRender: ->
			_this = @
			@ui.confirmation.droppable
				drop: (e, ui) ->
					$(ui.draggable).trigger "dropped", _this.model.id
	
	class List.Confirmations extends Marionette.CompositeView
		template: "confirmations/list/templates/confirmations"
		itemView: List.Confirmation
		itemViewContainer: "#confirmed-reservations-list"