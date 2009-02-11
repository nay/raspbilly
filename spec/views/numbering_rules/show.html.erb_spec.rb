require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/numbering_rules/show.html.erb" do
  include NumberingRulesHelper
  before(:each) do
    assigns[:numbering_rule] = @numbering_rule = stub_model(NumberingRule,
      :numbering_format => "value for numbering_format",
      :current_number => 1,
      :numbering_reset_type_id => 1
    )
  end

  it "should render attributes in <p>" do
    render "/numbering_rules/show.html.erb"
    response.should have_text(/value\ for\ numbering_format/)
    response.should have_text(/1/)
    response.should have_text(/1/)
  end
end

