class ShoppingListApp.Views.ShoppingListsShow extends Backbone.View
  tagName: "div"
  id: "shopping-list-detail-div"
  model: ShoppingListApp.Models.ShoppingList
  template: JST['shopping_lists/show']
  initialize: ->
    this.model.on('destroy', this.removeView, this)
  render: ->
    $(@el).html(@template())
    shopping_list = this.model.list
    shopping_list.fetch(
      success: (shopping_list)->
        shopping_list_view = new ShoppingListApp.Views.ShoppingListItemsIndex({ collection: shopping_list })
        shopping_list_view.render()
        shopping_list_view.el
        $("#shopping-list-items").html(shopping_list_view.el)
    )
  events:
    "click #add-item": "addItemToList"
    "click #done": "finishList"
  addItemToList: (e)->
    e.preventDefault()
    item = new ShoppingListApp.Models.ShoppingListItem({ name: $('#new-item').val() })
    this.model.addItem(item)
    $('#new-item').val("")
  finishList: (e)->
    e.preventDefault()
    this.model.finishedWithList()
  removeView: ->
    this.$el.remove()
  