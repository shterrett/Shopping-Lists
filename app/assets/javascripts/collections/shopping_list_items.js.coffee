class ShoppingListApp.Collections.ShoppingListItems extends Backbone.Collection
  model: ShoppingListApp.Models.ShoppingListItem
  base_url: ->
    base_url = this.url.replace("shopping_list_items", "")
    base_url
  resetCollection: ->
    non_persistent = this.where { persistent: false }
    non_persistent.forEach (item) ->
      item.destroy()
    this.forEach (item) ->
      item.set("purchased", false)
      item.save()
        
      
