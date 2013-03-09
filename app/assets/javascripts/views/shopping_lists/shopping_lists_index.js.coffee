class ShoppingListApp.Views.ShoppingListsIndex extends Backbone.View
  template: JST['shopping_lists/index']
  id: "shopping-list-collection"
  class: "all-shopping-lists"
  tagname: "section"
  initialize: ->
    @collection.on('add', this.updateCollection, this)
    @collection.on('change', this.updateCollection, this)
    @collection.on('remove', this.updateCollection, this)
    @collection.on('sync', this.render, this)
  render: ->
    $(@el).html(@template(shopping_lists: @collection))
  events:
    "click .name": "displayList"
    "click .delete-list": "deleteShoppingList"
    "click #add-list": "addNewList"
  displayList: (e)->
    $('#shopping-list-items').html("")
    $('#item-detail').html("")
    model = @getModelFromClick(e)
    shoppingList = new ShoppingListApp.Views.ShoppingListsShow({ model: model })
    shoppingList.render()
    $('#shopping-list-items').prepend(shoppingList.el)
  deleteShoppingList: (e)->
    model = @getModelFromClick(e)
    model.destroy()
  addNewList: (e)->
    e.preventDefault()
    this.collection.addList($('#new-list').val())
    $('#new-list').val("")
  updateCollection: ->
    @collection.fetch()
  removeListView: ->
    this.$el.remove()
  getModelFromClick: (event)->
    model_id = $(event.currentTarget.parentElement).attr("id")
    model = @collection.get(model_id)
