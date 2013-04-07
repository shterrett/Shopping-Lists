class ShoppingListApp.Routers.ShoppingLists extends Backbone.Router
  routes:
    '': 'index'
    '#': 'index'
    'test': 'test'  
    'shopping_lists/:id': 'shopping_list_show'
    'shopping_lists/:id/item/:item_id': 'item_detail'
  initialize: ->
    @collection = new ShoppingListApp.Collections.ShoppingLists()
  index: ->
    $('#item-detail').hide()
    $('#shopping-list-items').html("")
    @collection.fetch(
      success: (@collection)->
        view = new ShoppingListApp.Views.ShoppingListsIndex({ collection: @collection })
        content = view.render()
        $('#shopping-lists').html(content)
    )
  test: ->
    alert("test")
    return ""
  shopping_list_show: (id)->
    @index()
    $('#item-detail').html("")
    $('#shopping-list-items').html("")
    @model = new ShoppingListApp.Models.ShoppingList({ id: id })
    @model.fetch(
      success: (@model)->
        view = new ShoppingListApp.Views.ShoppingListsShow({ model: @model })
        view.render()
        $('#shopping-list-items').prepend(view.el)
    )
  item_detail: (id, item_id)->
    @model = new ShoppingListApp.Models.ShoppingList({ id: id })
    @model.list.fetch(
      success: (shopping_list)->
        @item = shopping_list.get(item_id)
        view = new ShoppingListApp.Views.ShoppingListItemsShow({ model: @item })
        view.render()
        $('#item-detail').html(view.el)
        $('#item-detail').fadeIn()
      )