class BillItem::Sale < BillItem::Base
  belongs_to :parent, :foreign_key => "parent_id", :class_name => "BillItem::Sale"
  attr_writer :formatted_unit_price

  def initialize(attributes = {})
    attributes = {:taxed => true}.merge(attributes)
    super
  end

  def formatted_unit_price=(p)
    self.unit_price = p ? p.sub(/,/, '').to_i : nil
  end

  def formatted_unit_price
    self.unit_price ? ((self.unit_price.to_s =~ /[-+]?\d{4,}/) ? (self.unit_price.to_s.reverse.gsub(/\G((?:\d+\.)?\d{3})(?=\d)/, '\1,').reverse) : self.unit_price.to_s) : nil
  end

  private
  def set_amount
    if self.unit_price && self.quantity
      self.amount = self.unit_price * self.quantity
    else
      self.amount = nil
    end
  end

end