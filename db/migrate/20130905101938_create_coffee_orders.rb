class CreateCoffeeOrders < ActiveRecord::Migration
  def change
    create_table :coffee_orders do |t|

      t.timestamps
    end
  end
end
