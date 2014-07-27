class AddUserIdToCoffeeOrders < ActiveRecord::Migration
  def change
    add_column :coffee_orders, :user_id, :integer
  end
end
