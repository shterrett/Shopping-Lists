class ShoppingListApp.Models.ShoppingList extends Backbone.Model
  defaults: ->
    "name": "Shopping List"
  initialize: ->
    this.list = new ShoppingListApp.Collections.ShoppingListItems()
    this.list.url = '/shopping_lists/' + this.get("id") + '/shopping_list_items'
  addItem: (item)->
    itemList = this.list
    itemList.add(item)
    console.log itemList.url
    itemList.sync()
  finishedWithList: ->
    itemList = this.get("list")
    itemList.resetCollection()

