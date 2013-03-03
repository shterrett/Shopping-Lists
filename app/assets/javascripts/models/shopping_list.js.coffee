class ShoppingListApp.Models.ShoppingList extends Backbone.Model
  defaults: ->
      "name": "Shopping List"
  initialize: ->
    this.list = new ShoppingListApp.Collections.ShoppingListItems()
    this.list.url = '/shopping_lists/' + this.get("id") + '/shopping_list_items'
  addItem: (item) ->
    itemList = this.get("list")
    itemList.add(item)
  finishedWithList: ->
    itemList = this.get("list")
    itemList.resetCollection()

