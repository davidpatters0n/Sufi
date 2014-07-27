class AddCoffeeOrderIdToCoffeeItems < ActiveRecord::Migration
  def change
    add_column :coffee_items, :coffee_order_id, :integer
  end
end
