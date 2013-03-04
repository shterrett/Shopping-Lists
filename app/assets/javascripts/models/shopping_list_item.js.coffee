class ShoppingListApp.Models.ShoppingListItem extends Backbone.Model
  defaults:
    name: null
    quantity: 1
    purchased: false
    persistent: false
  togglePurchased: -> 
    this.toggleAttribute("purchased")
  togglePersistent: -> 
    this.toggleAttribute("persistent")
  toggleAttribute: (attr) -> 
    if (this.get(attr) == true)
      this.attributes[attr] = false
      this.save()
      this.trigger('change')
    else 
      this.attributes[attr] = true
      this.save()
      this.trigger('change')
  updateQuantity: (qty) ->
    this.set { quantity: qty }
    this.save()
    