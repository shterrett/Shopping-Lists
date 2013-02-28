class ShoppingListApp.Collections.ShoppingLists extends Backbone.Collection

  model: ShoppingListApp.Models.ShoppingList
  addList: function(item_name)
  	var shoppingList = new ShoppingList({ name: item_name })
  	this.add(shoppingList)
