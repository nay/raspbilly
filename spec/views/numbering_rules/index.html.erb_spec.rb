require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/numbering_rules/index.html.erb" do
  include NumberingRulesHelper
  
  before(:each) do
    assigns[:numbering_rules] = [
      stub_model(NumberingRule,
        :numbering_format => "value for numbering_format",
        :current_number => 1,
        :numbering_reset_type_id => 1
      ),
      stub_model(NumberingRule,
        :numbering_format => "value for numbering_format",
        :current_number => 1,
        :numbering_reset_type_id => 1
      )
    ]
  end

  it "should render list of numbering_rules" do
    render "/numbering_rules/index.html.erb"
    response.should have_tag("tr>td", "value for numbering_format".to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
  end
end

