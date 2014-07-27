class FixColumnName < ActiveRecord::Migration
  def self.up
    rename_column :coffee_types, :type, :type_of_coffee
  end

  def self.down
  end
end