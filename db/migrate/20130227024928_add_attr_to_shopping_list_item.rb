class AddAttrToShoppingListItem < ActiveRecord::Migration
  def change
    add_column :shopping_list_items, :name, :string
    add_column :shopping_list_items, :quantity, :integer
    add_column :shopping_list_items, :purchased, :boolean
    add_column :shopping_list_items, :persistent, :boolean
  end
end
