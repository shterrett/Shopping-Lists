window.ShoppingListApp =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  init: -> 
          new ShoppingListApp.Routers.ShoppingLists()
          Backbone.history.start()

$(document).ready ->
  ShoppingListApp.init()