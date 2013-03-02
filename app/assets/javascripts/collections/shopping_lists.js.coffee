class ShoppingListApp.Collections.ShoppingLists extends Backbone.Collection
  url: '/shopping_lists'
  model: ShoppingListApp.Models.ShoppingList
  addList: (item_name) ->
  	shoppingList = new ShoppingList({ name: item_name })
  	this.add(shoppingList)
