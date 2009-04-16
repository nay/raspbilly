class BillItem::Base < ActiveRecord::Base
  set_table_name "bill_items"
  belongs_to :bill

  attr_protected :bill_id, :parent_id, :amount
  attr_accessor :formatted_amount, :set_formatted_amount

  before_save :avoid_saving_abstract, :set_amount
  after_save :set_formatted_amount, :save_bill

  def formatted_amount
    set_formatted_amount if !@formatted_amount && self.amount
    @formatted_amount
  end

  private
  def avoid_saving_abstract
    raise "Can't save BillItem::Base object" if self.class == BillItem::Base
  end
  def set_amount
    self.amount = self.formatted_amount ? self.formatted_amount.sub(/,/, '').to_i : nil
  end
  def set_formatted_amount
    self.formatted_amount = amount ? ((amount.to_s =~ /[-+]?\d{4,}/) ? (amount.to_s.reverse.gsub(/\G((?:\d+\.)?\d{3})(?=\d)/, '\1,').reverse) : amount.to_s) : nil
  end
  def save_bill
    bill.save! if bill # to update total_amount
  end
end
