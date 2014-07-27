class AddQuantityToCoffeeItems < ActiveRecord::Migration
  def change
    add_column :coffee_items, :quantity, :integer
  end
end
