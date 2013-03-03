class ShoppingListItem < ActiveRecord::Base
  
  attr_accessible :name, :quantity, :purchased, :persistent
  
  belongs_to :shopping_list
  
  validates :name, presence: true
  
  before_save :default_values

  private
  
    def default_values
      self.quantity ||= 1
      self.purchased ||= false
      self.persistent ||= false
      return true
    end

end
