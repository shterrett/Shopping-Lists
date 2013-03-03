class ShoppingListApp.Routers.ShoppingLists extends Backbone.Router
  routes:
    '': 'index'          
  initialize: ->
    @collection = new ShoppingListApp.Collections.ShoppingLists()
  index: ->
    @collection.fetch(
      success: (@collection)->
        view = new ShoppingListApp.Views.ShoppingListsIndex({ collection: @collection })
        content = view.render()
        $('#shopping-lists').html(content)
    )
    