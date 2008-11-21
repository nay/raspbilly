class CreateBills < ActiveRecord::Migration
  def self.up
    create_table :bills do |t|
      t.string :code
      t.date :written_on
      t.string :customer_name
      t.string :subject
      t.string :payment_condition
      t.date :payment_due_date
      t.text :bank
      t.text :from
      t.integer :total_amount
      t.integer :tax
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :bills
  end
end
