class AddQuantityToBillItems < ActiveRecord::Migration
  def self.up
    add_column :bill_items, :quantity, :integer
    add_column :bill_items, :unit_price, :integer
  end

  def self.down
    remove_column :bill_items, :quantity
    remove_column :bill_items, :unit_price
  end
end
