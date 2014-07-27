class CreateCoffeeItems < ActiveRecord::Migration
  def change
    create_table :coffee_items do |t|

      t.timestamps
    end
  end
end
