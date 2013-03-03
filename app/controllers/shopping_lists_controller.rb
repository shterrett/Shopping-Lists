class ShoppingListsController < ApplicationController
  respond_to :json
  
  def create
    respond_with current_user.shopping_lists.create(params[:shopping_list])
  end      
  
  def update
    respond_with ShoppingList.update(params[:id], params[:shopping_list])
  end
  
  def show
    respond_with ShoppingList.find(params[:id])    
  end
  
  def index
    respond_with current_user.shopping_lists
  end
  
  def destroy
    respond_with ShoppingList.destroy(params[:id])
  end
  
end
