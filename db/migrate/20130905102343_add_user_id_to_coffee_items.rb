class AddUserIdToCoffeeItems < ActiveRecord::Migration
  def change
    add_column :coffee_items, :user_id, :integer
  end
end
