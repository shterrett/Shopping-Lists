class ShoppingListApp.Views.ShoppingListItemsShow extends Backbone.View
  tagName: "section"
  template: JST['shopping_list_items/show']
  model: ShoppingListApp.Models.ShoppingListItem
  id: ->
    return this.model.get('name') + "-detail"
  initialize: ->
    this.model.on('change', this.render, this)
    this.model.on('destroy', this.closeDetail, this)
  render: ->
    this.$el.html(@template({ item: @model }))
  events:
    "click #toggle-persistent": "togglePersistent"
    "click #toggle-purchased": "togglePurchased"
    "change input": "updateQuantity"
    "click #detail-done": "closeDetail"
    "click #title": "closeDetail"
  togglePersistent: ->
    this.model.togglePersistent()
  togglePurchased: ->
    this.model.togglePurchased()
  updateQuantity: ->
    new_quantity = this.$el.find('input').val()
    this.model.updateQuantity(new_quantity)
  closeDetail: ->
    this.$el.html("")
  