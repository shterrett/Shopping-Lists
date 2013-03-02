class ShoppingListApp.Models.ShoppingListItem extends Backbone.Model
  defaults:
    name: null
    quantity: 1
    purchased: false
    persistent: false
  TogglePurchased: -> 
    this.toggleAttribute("purchased")
  TogglePersistent: -> 
    this.toggleAttribute("persistent")
  ToggleAttribute: (attr) -> 
    if (this.get(attr) == true)
      this.attributes[attr] = false
      this.trigger('change')
    else 
      this.attributes[attr] = true
      this.trigger('change')
  UpdateQuantity: (qty) ->
    this.set { quantity: qty }
    