class ShoppingListApp.Views.ShoppingListsShow extends Backbone.View
  tagName: "div"
  id: "shopping-list-detail-div"
  model: ShoppingListApp.Models.ShoppingList
  template: JST['shopping_lists/show']
  initialize: ->
    this.model.on('destroy', this.removeView, this)
  render: ->
    $(@el).html(@template)
  events:
    "click #add-item": "addItemToList"
    "click #done": "finishList"
  addItemToList: ->
    e.preventDefault()
    item = new Item({ name: $('#new-item').val() })
    this.model.addItem(item)
    $('#new-item').val("")
  finishList: (e)->
    e.preventDefault()
    this.model.finishedWithList()
  removeView: ->
    this.$el.remove()
  