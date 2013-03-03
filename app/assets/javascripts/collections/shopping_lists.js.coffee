class ShoppingListApp.Collections.ShoppingLists extends Backbone.Collection
  url: '/shopping_lists'
  model: ShoppingListApp.Models.ShoppingList
  addList: (item_name)->
    shoppingList = new ShoppingListApp.Models.ShoppingList({ name: item_name })
    shoppingList.save()
    this.add(shoppingList)
