class Bill < ActiveRecord::Base
  attr_protected :total_amount, :tax

  validates_presence_of :customer_name

  has_many :sale_items, :class_name => "BillItem::Sale"
  has_many :out_of_pocket_items, :class_name => "BillItem::OutOfPocket"
  has_many :items, :class_name => "BillItem::Base" # 計算用

  accepts_nested_attributes_for :sale_items, :out_of_pocket_items, :allow_destroy => true, :reject_if => proc {|attributes| attributes['name'].blank? && attributes['amount'].blank? && attributes['description'].blank? }

  after_save :update_total_and_tax

  def update_total_and_tax
    sum = 0
    taxed_sum = 0
    sale_items.each{|i|
      return unless i.amount
      sum += i.amount
      taxed_sum += i.amount if i.taxed?
    }
    out_of_pocket_items.each{|i|
      return unless i.amount
      sum += i.amount
      taxed_sum += i.amount if i.taxed?
    }
    self.tax = (taxed_sum * 1.05).ceil - taxed_sum # TODO: 計算方式の登録
    self.total_amount = sum
    self.class.update_all("tax = #{tax}, total_amount = #{total_amount}", "id = #{self.id}")
  end

end
