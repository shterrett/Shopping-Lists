class ShoppingListItemsController < ApplicationController
  respond_to :json
  
  def create
    list = ShoppingList.find_by_id(params[:shopping_list_id])
    item_hash = { name: params[:name], quantity: params[:quantity], purchased: params[:purchased], persistent: params[:persistent] }
    respond_with list.shopping_list_items.create(item_hash)
  end
  
  def update
    respond_with ShoppingListItem.find_by_id(params[:id]).update_attributes(params[:shopping_list_item])
  end
  
  def index
    list = ShoppingList.find_by_id(params[:shopping_list_id])
    respond_with list.shopping_list_items
  end
  
  def destroy
    respond_with ShoppingListItem.destroy(params[:id])
  end
  
end
