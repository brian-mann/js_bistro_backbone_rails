@Bistro.module "ReservationsApp.List", (List, App, Backbone, Marionette, $, _) ->
	
	class List.Pending extends Marionette.ItemView
		template: "reservations/list/templates/_pending"
	
	class List.Pendings extends Marionette.CompositeView
		template: "reservations/list/templates/pendings"
		itemView: List.Pending
		itemViewContainer: "#pending-reservations-list"
		
		appendHtml: (cv, iv, index) ->
			childrenContainer = cv.$(cv.itemViewContainer || cv.el)
			children 					= childrenContainer.children()
			if children.size() <= index
				childrenContainer.append(iv.el)
			else
				childrenContainer.children().eq(index).before(iv.el)