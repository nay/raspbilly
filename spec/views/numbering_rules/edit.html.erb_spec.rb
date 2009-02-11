require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/numbering_rules/edit.html.erb" do
  include NumberingRulesHelper
  
  before(:each) do
    assigns[:numbering_rule] = @numbering_rule = stub_model(NumberingRule,
      :new_record? => false,
      :numbering_format => "value for numbering_format",
      :current_number => 1,
      :numbering_reset_type_id => 1
    )
  end

  it "should render edit form" do
    render "/numbering_rules/edit.html.erb"
    
    response.should have_tag("form[action=#{numbering_rule_path(@numbering_rule)}][method=post]") do
      with_tag('input#numbering_rule_numbering_format[name=?]', "numbering_rule[numbering_format]")
      with_tag('input#numbering_rule_current_number[name=?]', "numbering_rule[current_number]")
      with_tag('input#numbering_rule_numbering_reset_type_id[name=?]', "numbering_rule[numbering_reset_type_id]")
    end
  end
end


