class AddAttrToShoppingList < ActiveRecord::Migration
  def change
    add_column :shopping_lists, :name, :string
    add_column :shopping_lists, :target_date, :date
  end
end
