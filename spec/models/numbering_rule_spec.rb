require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe NumberingRule do
  before(:each) do
    @valid_attributes = {
      :numbering_format => "value for numbering_format",
      :current_number => 1,
      :numbering_reset_type_id => 1
    }
  end

  it "should create a new instance given valid attributes" do
    NumberingRule.create!(@valid_attributes)
  end
end
