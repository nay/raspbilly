class CreateBillItems < ActiveRecord::Migration
  def self.up
    create_table :bill_items do |t|
      t.integer :bill_id
      t.integer :parent_id
      t.string :type
      t.integer :amount
      t.string :name
      t.boolean :taxed
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :bill_items
  end
end
