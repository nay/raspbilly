class Bill < ActiveRecord::Base
  attr_protected :total_amount, :tax

  validates_presence_of :customer_name
end
