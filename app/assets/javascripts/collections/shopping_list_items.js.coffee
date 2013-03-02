class ShoppingListApp.Collections.ShoppingListItems extends Backbone.Collection

  model: ShoppingListApp.Models.ShoppingListItem
	resetCollection: ->
		non_persistent = this.where { persistent: false }
		non_persistent.forEach (item) -> 
			item.destroy()
		this.forEach (item) -> 
			item.set { purchased: false }
