class BillItem::OutOfPocket < BillItem::Base
  belongs_to :parent, :foreign_key => "parent_id", :class_name => "BillItem::OutOfPocket"

  attr_protected :taxed
  before_save :avoid_saving_with_wrong_taxed

  def initialize(attributes = {})
    super
    self.taxed = false
  end

  private
  def avoid_saving_with_wrong_taxed
    raise "Illegal taxed" if taxed?
  end

end