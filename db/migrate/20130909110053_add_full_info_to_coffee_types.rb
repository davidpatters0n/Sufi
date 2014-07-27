class AddFullInfoToCoffeeTypes < ActiveRecord::Migration
  def change
    add_column :coffee_types, :fullInfo, :string
  end
end
