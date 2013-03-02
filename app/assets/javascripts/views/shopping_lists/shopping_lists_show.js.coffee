class ShoppingListApp.Views.ShoppingListsIndex extends Backbone.View
  tagName: "section"
  id: "shopping-list-detail"
  template: JST['shopping_lists/show']
	initialize: ->
		this.model.on('destroy', this.removeView, this)
	render: ->
		this.$el.html(this.template())
		itemListView = new ItemListView({ collection: this.model.get('list') });
		itemListView.render()
		this.$el.children('form').after(itemListView.el)
	events:
		"click #add-item": "addItemToList"
		"click #done": "finishList"
	addItemToList: ->
		e.preventDefault()
		item = new Item({ name: $('#new-item').val() })
		this.model.addItem(item)
		$('#new-item').val("")
	finishList: e ->
		e.preventDefault();
		this.model.finishedWithList();
	removeView: ->
		this.$el.remove()