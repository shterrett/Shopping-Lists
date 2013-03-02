class ShoppingListApp.Models.ShoppingList extends Backbone.Model
	defaults: -> 
			name: "Shopping List"
			list: new ItemList()

	addItem: (item) ->
		itemList = this.get("list")
		itemList.add(item)

	finishedWithList: ->
    itemList = this.get("list")
		itemList.resetCollection()

