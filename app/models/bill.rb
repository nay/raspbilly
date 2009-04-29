class Bill < ActiveRecord::Base
  attr_protected :total_amount, :total_sales_tax, :total_sales_amount, :total_out_of_pocket_amount

  validates_presence_of :customer_name

  has_many :sale_items, :class_name => "BillItem::Sale"
  has_many :out_of_pocket_items, :class_name => "BillItem::OutOfPocket"
  has_many :items, :class_name => "BillItem::Base" # 計算用

  accepts_nested_attributes_for :sale_items, :out_of_pocket_items, :allow_destroy => true, :reject_if => proc {|attributes| attributes['name'].blank? && attributes['amount'].blank? && attributes['description'].blank? }

  after_save :update_total_and_tax

  def self.default_subject
    "件名なし"
  end

#=begin
  acts_as_dhtmlxgrid :columns => [
    {:header => %q(コード), :eval => "record.code", :width => 80, :type => :ro, :align => 'left', :sort => 'str'},
    {:header => %q(顧客名), :eval => "record.customer_name", :width => 80, :type => :ro, :align => :left, :sort => :str},
    {:header => %q(件名), :eval => "record.subject+\"^/bills/\"+record.id.to_s+\"^_self\"", :width => 200, :type => :link, :align => :left, :sort => :str, :default => self.default_subject},
    {:header => %q(請求日), :eval => "record.written_on.strftime(\"%Y/%m/%d\")", :width => 80, :type => :ro, :align => :center, :sort => :date},
    {:header => %q(請求額), :eval => "record.total_amount", :width => 80, :type => :price, :align => :right, :sort => :int},
    {:header => %q(更新日), :eval => "record.updated_at.strftime(\"%Y/%m/%d %H:%M:%S\")", :width => 150, :type => :ro, :align => :left, :sort => :date},
  ]
#=end

  private
  def amounts_filled?
    !items.detect{|i| i.amount.nil?}
  end

  def update_total_sales
    if !amounts_filled?
      self.total_sales_amount = nil
      self.total_sales_tax = nil
    else
      sum = 0
      taxed_sum = 0
      sale_items.each{|i|
        return unless i.amount
        sum += i.amount
        taxed_sum += i.amount if i.taxed?
      }
      self.total_sales_amount = sum
      self.total_sales_tax = (taxed_sum * 1.05).ceil - taxed_sum # TODO: 計算方式の登録
    end
  end

  def update_total_out_of_pocket
    if !amounts_filled?
      self.total_out_of_pocket = nil
    else
      sum = 0
      out_of_pocket_items.each{|i|
        return unless i.amount
        sum += i.amount
      }
      self.total_out_of_pocket_amount = sum
    end
  end

  def update_total_and_tax
    update_total_sales
    update_total_out_of_pocket
    if amounts_filled?
      self.total_amount = self.total_sales_amount + self.total_sales_tax + self.total_out_of_pocket_amount
    else
      self.total_amount = nil
    end
    self.class.update_all("total_sales_tax = #{total_sales_tax ? total_sales_tax : 'null'}, total_sales_amount = #{total_sales_amount ? total_sales_amount : 'null'}, total_out_of_pocket_amount =  #{total_out_of_pocket_amount ? total_out_of_pocket_amount : 'null'}, total_amount = #{total_amount ? total_amount : 'null'}", "id = #{self.id}")
  end

end
