class ShoppingListApp.Models.ShoppingList extends Backbone.Model
	defaults: -> 
			name: "Shopping List"
			list: new ItemList()

	addItem: (item) ->
		var itemList = this.get("list")
		itemList.add(item)

	finishedWithList: ->
    var itemList = this.get("list")
		itemList.resetCollection()

