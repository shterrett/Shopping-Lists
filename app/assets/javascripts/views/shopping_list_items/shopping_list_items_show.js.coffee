class ShoppingListApp.Views.ShoppingListItemsShow extends Backbone.View
  tagName: "section"
  template: JST['shopping_list_items/show']
	id: ->
		return this.model.get('name') + "-detail"
	initialize: ->
		this.model.on('change', this.render, this)
		this.model.on('destroy', this.closeDetail, this)
	render: ->
		attr = this.model.toJSON()
		this.$el.html(this.template(attr))
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
