class NumberingRule < ActiveRecord::Base
  validates_presence_of :current_number
  validates_presence_of :numbering_format
end
