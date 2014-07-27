class CreateCoffeeTypes < ActiveRecord::Migration
  def change
    create_table :coffee_types do |t|
      t.string :name
      t.string :image
      t.string :type
      t.integer :temp
      t.boolean :caffeinated
      t.text :info
      t.string :price

      t.timestamps
    end
  end
end
