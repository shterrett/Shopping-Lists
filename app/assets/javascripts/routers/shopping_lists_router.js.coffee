class ShoppingListApp.Routers.ShoppingLists extends Backbone.Router
  routes:
    'users/:id': 'index'
    'entries/:id': 'show'
              
  initialize: ->
  
  index: ->
    view = new 
    $('').html(view.render().el)

  show: (id) ->
    