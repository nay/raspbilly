class Bill < ActiveRecord::Base
  attr_protected :total_amount, :tax

  validates_presence_of :customer_name

  has_many :sale_items, :class_name => "BillItem::Sale"
  has_many :out_of_pocket_items, :class_name => "BillItem::OutOfPocket"
  accepts_nested_attributes_for :sale_items, :out_of_pocket_items, :allow_destroy => true, :reject_if => proc {|attributes| attributes['name'].blank? && attributes['amount'].blank? && attributes['description'].blank? }
end
