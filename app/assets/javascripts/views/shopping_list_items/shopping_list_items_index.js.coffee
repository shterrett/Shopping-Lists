class ShoppingListApp.Views.ShoppingListItemsIndex extends Backbone.View
  tagName: "ul"
  id: "item-list"
  template: JST['shopping_list_items/index']
  collection: ShoppingListApp.Collections.ShoppingListItems
  initialize: ->
    this.collection.on("add", this.render, this)
    #this.collection.on("change", this.render, this)
    this.collection.on("destroy", this.render, this)
  render: ->
    $(@el).html(@template(shopping_list_items: @collection ))
  events:
    "click .checkbox" : "markPurchased",
    "click .title" : "openDetail",
    "click .delete-item": "destroyItem"
  markPurchased: (e)->
    cbox = e.target
    model = this.getModelFromClick(e)
    if (cbox.checked)
      $(cbox.parentElement).addClass("purchased")
      model.togglePurchased()
    else
      $(cbox.parentElement).removeClass("purchased")
      model.togglePurchased()
  openDetail: (e)->
    item = this.getModelFromClick(e)
    detail_view = new ShoppingListApp.Views.ShoppingListItemsShow( model: item )
    detail_view.render()
    $('#item-detail').html(detail_view.el)
  destroyItem: (e)->
    item = this.getModelFromClick(e)
    item.destroy()
  remove_item: ->
    this.$el.remove()
  getModelFromClick: (event)->
    model_id = $(event.target.parentElement).attr("id")
    model = @collection.get(model_id)