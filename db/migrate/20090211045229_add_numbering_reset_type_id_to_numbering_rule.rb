class AddNumberingResetTypeIdToNumberingRule < ActiveRecord::Migration
  def self.up
    add_column :numbering_rules, :numbering_reset_type_id, :integer
  end

  def self.down
    remove_column :numbering_rules, :numbering_reset_type_id
  end
end
