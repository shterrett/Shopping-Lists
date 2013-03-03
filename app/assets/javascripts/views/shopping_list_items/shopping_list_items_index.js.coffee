class ShoppingListApp.Views.ShoppingListItemsIndex extends Backbone.View
  tagName: "ul"
  id: "item-list"
  template: JST['shopping_list_items/index']
  collection: ShoppingListApp.Collections.ShoppingListItems
	initialize: ->
    this.collection.on("add", this.render, this)
    this.collection.on("change", this.render, this)
    this.collection.on("destroy", this.remove, this)
  render: ->
    attr = this.collection.toJSON()
    this.$el.html(this.template(attr))
  events:
    "click .checkbox" : "markPurchased",
		"click .title" : "openDetail",
		"click .delete-item": "destroyItem"
  # Need to scope down to clicked line
  markPurchased: ->
    cbox = this.$el.children("input")
    if (this.$el.children("input:checked").length == 0)
      this.$el.removeClass("purchased")
      this.model.togglePurchased()
    else
      this.$el.addClass("purchased")
      this.model.togglePurchased()
	openDetail: -> 
		detailView = new ItemDetail model: this.model
		detailView.render()
		$('#item-detail').html(detailView.el)
	destroyItem: -> 
		this.model.destroy()
	remove: ->
		this.$el.remove()
