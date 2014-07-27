class FixInfoColumnName < ActiveRecord::Migration
    def self.up
    rename_column :coffee_types, :info, :basicInfo
  end

  def self.down
  end
end

