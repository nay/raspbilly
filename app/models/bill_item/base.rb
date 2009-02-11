class BillItem::Base < ActiveRecord::Base
  set_table_name "bill_items"
  belongs_to :bill

  attr_protected :bill_id, :parent_id
  attr_accessor :formatted_amount

  before_save :avoid_saving_abstract

  private
  def avoid_saving_abstract
    raise "Can't save BillItem::Base object" if self.class == BillItem::Base
  end
end
