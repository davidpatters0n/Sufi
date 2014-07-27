class AddDrinksToCoffeeTypes < ActiveRecord::Migration
  def change
    add_column :coffee_types, :drinks, :integer
  end
end
