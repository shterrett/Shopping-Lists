class AddUserIdToShoppingLists < ActiveRecord::Migration
  def change
    add_column :shopping_lists, :user_id, :int
  end
end
