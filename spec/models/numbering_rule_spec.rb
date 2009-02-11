require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe NumberingRule do
  before(:each) do
    @valid_attributes = {
      :numbering_format => "value for numbering_format",
      :current_number => 1,
      :numbering_reset_type_id => 1
    }
  end

  it "モデルをちゃんと作成できること" do
    NumberingRule.create!(@valid_attributes)
  end

  it "モデルの作成に失敗すること" do
	lambda { NumberingRule.create! }.should raise_error(ActiveRecord::RecordInvalid)
  end

  it "採番できること" do
    rule = NumberingRule.create!(:numbering_format => '%s', :current_number => 0)
	rule.create_number.should == '1'
	rule.current_number.should == 1
  end

  it "採番できること(ゼロ埋め)" do
    rule = NumberingRule.create!(:numbering_format => '%5s', :current_number => 0)
	rule.create_number.should == '00001'
	rule.current_number.should == 1
  end

  it "採番できること（日付付き）" do
    Time.stub!(:now).and_return(Time.local(2009, 2, 11))
    rule = NumberingRule.create!(:numbering_format => 'EL%Y%m%d_%s', :current_number => 0)
	rule.create_number.should == 'EL20090211_1'
	rule.current_number.should == 1
  end
end
