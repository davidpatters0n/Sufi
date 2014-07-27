class AddCoffeeItemIdToCoffeeOrders < ActiveRecord::Migration
  def change
    add_column :coffee_orders, :coffee_item_id, :integer
  end
end
