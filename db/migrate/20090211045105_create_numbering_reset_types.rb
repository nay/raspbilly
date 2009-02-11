class CreateNumberingResetTypes < ActiveRecord::Migration
  def self.up
    create_table :numbering_reset_types do |t|
      t.string :name
      t.text :script

      t.timestamps
    end
  end

  def self.down
    drop_table :numbering_reset_types
  end
end
