class Bill < ActiveRecord::Base
  attr_protected :total_amount, :tax

  validates_presence_of :customer_name

  has_many :sale_items, :class_name => "BillItem::Sale"
  has_many :out_of_pocket_items, :class_name => "BillItem::OutOfPocket"
  accepts_nested_attributes_for :sale_items, :out_of_pocket_items, :allow_destroy => true, :reject_if => proc {|attributes| attributes['name'].blank? && attributes['amount'].blank? && attributes['description'].blank? }

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

end
