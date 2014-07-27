class CoffeeOrder < ActiveRecord::Base
  belongs_to :user
  has_many :coffee_items
end
