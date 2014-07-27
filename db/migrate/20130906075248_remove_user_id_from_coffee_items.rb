class RemoveUserIdFromCoffeeItems < ActiveRecord::Migration
  def change
    remove_column :coffee_items, :user_id, :integer
  end
end
