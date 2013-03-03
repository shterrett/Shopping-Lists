class ShoppingListApp.Views.ShoppingListItemsIndex extends Backbone.View
  tagName: "ul"
  id: "item-list"
  template: JST['shopping_list_items/index']
  collection: ShoppingListApp.Collections.ShoppingListItems
  initialize: ->
    this.collection.on("add", this.render, this)
    this.collection.on("change", this.render, this)
    this.collection.on("destroy", this.render, this)
  render: ->
    $(@el).html(@template(shopping_list_items: @collection ))
  events:
    "click .checkbox" : "markPurchased",
    "click .title" : "openDetail",
    "click .delete-item": "destroyItem"
  markPurchased: ->
    cbox = this.$el.children("input")
    if (this.$el.children("input:checked").length == 0)
      this.$el.removeClass("purchased")
      this.model.togglePurchased()
    else
      this.$el.addClass("purchased")
      this.model.togglePurchased()
  openDetail: (e)->
    item = this.getModelFromClick(e)
    detail_view = new ShoppingListApp.Views.ShoppingListItemsShow( model: item )
    detail_view.render()
    $('#item-detail').html(detailView.el)
  destroyItem: (e)->
    item = this.getModelFromClick(e)
    item.destroy()
  remove_item: ->
    this.$el.remove()
  getModelFromClick: (event)->
    model_id = $(event.toElement.parentElement).attr("id")
    model = @collection.get(model_id)