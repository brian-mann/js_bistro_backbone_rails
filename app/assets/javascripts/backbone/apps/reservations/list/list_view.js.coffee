@Bistro.module "ReservationsApp.List", (List, App, Backbone, Marionette, $, _) ->
	
	class List.Pending extends Marionette.ItemView
		template: "reservations/list/templates/_pending"
		
		events:
			"dropped" : "isDropped"
			
		isDropped: (e, confirmation_id) ->
			console.log @model.id, @model.isNew()
			@model.save confirmation_id: confirmation_id
			@trigger "has:been:confirmed", @model
		
		onRender: ->
			@$el.draggable
				opacity: ".5"
	
	class List.Empty extends Marionette.ItemView
		template: "reservations/list/templates/_empty"
	
	class List.Pendings extends Marionette.CompositeView
		template: "reservations/list/templates/pendings"
		# id: "pending-reservations-list"
		itemView: List.Pending
		emptyView: List.Empty
		itemViewContainer: "#pending-reservations-list"
		
		# ui:
		# 	items: "#pending-reservations-list"
		# 	item: ".pending-item"
		
		appendHtml: (cv, iv, index) ->
			childrenContainer = if cv.itemViewContainer then cv.$(cv.itemViewContainer) else cv.$el
			children 					= childrenContainer.children()
			if children.size() <= index
				childrenContainer.append(iv.el)
			else
				childrenContainer.children().eq(index).before(iv.el)