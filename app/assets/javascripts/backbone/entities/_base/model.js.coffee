@Bistro.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->
	
	class Entities.Model extends Backbone.Model
		
		processForm: (data, collection = false) ->
			isNew = @isNew()
			@save data,
				success: =>
					if isNew
						collection.add @
						@trigger "created"
					else
						@trigger "saved"