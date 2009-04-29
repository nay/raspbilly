class CreateSenders < ActiveRecord::Migration
  def self.up
    create_table :senders do |t|
      t.string :name
      t.text :address
      t.boolean :is_default, :default => false, :null => false # default 予約名かな

      t.timestamps
    end
  end

  def self.down
    drop_table :senders
  end
end
