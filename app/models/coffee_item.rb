class CoffeeItem < ActiveRecord::Base
  belongs_to :coffee_order
  belongs_to :coffee_type
end
