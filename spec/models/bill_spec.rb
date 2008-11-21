require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Bill do
  before(:each) do
    @valid_attributes = {
      :code => "value for code",
      :written_on => Date.today,
      :customer_name => "value for customer_name",
      :subject => "value for subject",
      :payment_condition => "value for payment_condition",
      :payment_due_date => Date.today,
      :bank => "value for bank",
      :from => "value for from",
      :total_amount => "1",
      :tax => "1",
      :description => "value for description"
    }
  end

  it "should create a new instance given valid attributes" do
    Bill.create!(@valid_attributes)
  end
end
