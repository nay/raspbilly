require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe NumberingResetType do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :script => "value for script"
    }
  end

  it "should create a new instance given valid attributes" do
    NumberingResetType.create!(@valid_attributes)
  end
end
