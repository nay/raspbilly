class Sender < ActiveRecord::Base
  validates_presence_of :name, :address

  before_save :reset_default

  def default?
    is_default?
  end

  private
  def reset_default
    if default?
      if self.new_record?
        self.class.update_all("is_default = 0", "id != #{self.id}")
      else
        self.class.update_all("is_default = 0")
      end
    end
  end
end
