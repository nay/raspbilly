require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Sender do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :address => "value for address"
    }
  end

  it "should create a new instance given valid attributes" do
    Sender.create!(@valid_attributes)
  end
end
