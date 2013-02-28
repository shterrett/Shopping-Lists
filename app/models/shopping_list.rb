class ShoppingList < ActiveRecord::Base

  attr_accessible :name, :target_date
  
  has_many :shopping_list_items
  belongs_to :user
  
  validate :name, presence: true
  
  before_save :default_values
  
  private
  
    def default_values
      self.target_date ||= Date.today
    end
  
end
