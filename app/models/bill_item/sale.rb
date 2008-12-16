class BillItem::Sale < BillItem::Base
  belongs_to :parent, :foreign_key => "parent_id", :class_name => "BillItem::Sale"

  def initialize(attributes = {})
    attributes = {:taxed => true}.merge(attributes)
    super
  end

end