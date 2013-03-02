class ShoppingListApp.Views.ShoppingListsIndex extends Backbone.View
  template: JST['shopping_lists/index']
	id: "shopping-list-collection"
	class: "all-shopping-lists"
	initialize: ->
		this.collection.on('change', this.render, this)
	render: ->
		attr = this.collection.toJSON()
		this.$el.html(this.template(attr))
  events:
    "click .name": "displayList"
		"click .delete-list": "deleteShoppingList"
		"click #add-list": "addNewList"
	displayList: e ->
		shoppingList = new ShoppingListDetailView({ model: this.model })
		shoppingList.render()
		$('#single-shopping-list').html(shoppingList.el)
		$('#single-shopping-list').append('<section id="item-detail"></section>')
	deleteShoppingList: e ->
		this.model.destroy()
	addNewList: e ->
		e.preventDefault()
		this.collection.addList($('#new-list').val())
		$('#new-list').val("")
	addOne: shoppingList ->
    shoppingListView = new ShoppingListView({ model: shoppingList })
		shoppingListView.render()
		$('#shopping-lists').append(shoppingListView.el)
  removeListView: ->
		this.$el.remove()
