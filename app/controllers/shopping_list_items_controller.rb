class ShoppingListItemsController < ApplicationController
  respond_to :json
  
  def create
    respond_with ShoppingListItem.create()
  end
  
  def update
    
  end
  
  def show
    
  end
  
  def index
    list = ShoppingList.find_by_id(params[:shopping_list_id])
    respond_with list.shopping_list_items
  end
  
  def destroy
    respond_with ShoppingListItem.destroy(params[:id])
  end
  
end
