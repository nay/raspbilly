class CreateNumberingRules < ActiveRecord::Migration
  def self.up
    create_table :numbering_rules do |t|
      t.string :numbering_format
      t.integer :current_number

      t.timestamps
    end
  end

  def self.down
    drop_table :numbering_rules
  end
end
