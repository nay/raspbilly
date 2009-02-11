require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/numbering_reset_types/new.html.erb" do
  include NumberingResetTypesHelper
  
  before(:each) do
    assigns[:numbering_reset_type] = stub_model(NumberingResetType,
      :new_record? => true,
      :name => "value for name",
      :script => "value for script"
    )
  end

  it "should render new form" do
    render "/numbering_reset_types/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", numbering_reset_types_path) do
      with_tag("input#numbering_reset_type_name[name=?]", "numbering_reset_type[name]")
      with_tag("textarea#numbering_reset_type_script[name=?]", "numbering_reset_type[script]")
    end
  end
end


