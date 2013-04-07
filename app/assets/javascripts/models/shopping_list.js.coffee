class ShoppingListApp.Models.ShoppingList extends Backbone.Model
  defaults: ->
    "name": "Shopping List"
  initialize: ->
    this.url = '/shopping_lists/' + this.get("id")
    this.list = new ShoppingListApp.Collections.ShoppingListItems()
    this.list.url = '/shopping_lists/' + this.get("id") + '/shopping_list_items'
  addItem: (item)->
    itemList = this.list
    item.set("url", itemList.url)
    itemList.add(item)
    item.save()
  finishedWithList: ->
    itemList = this.list
    itemList.resetCollection()

