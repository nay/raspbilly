class AddTotalSalesAmountToBills < ActiveRecord::Migration
  def self.up
    add_column :bills, :total_sales_amount, :integer
    rename_column :bills, :tax, :total_sales_tax
    add_column :bills, :total_out_of_pocket_amount, :integer
  end

  def self.down
    remove_column :bills, :total_sales_amount
    rename_column :bills, :total_sales_tax, :tax
    remove_column :bills, :total_out_of_pocket_amount
  end
end
