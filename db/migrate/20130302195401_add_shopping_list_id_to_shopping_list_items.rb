class AddShoppingListIdToShoppingListItems < ActiveRecord::Migration
  def change
    add_column :shopping_list_items, :shopping_list_id, :int
  end
end
