@Bistro.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->
	
	class Entities.Model extends Backbone.Model
		
		processForm: (data) ->
			
			@save data,
				success: ->
					console.log "this saved", data