require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/numbering_reset_types/edit.html.erb" do
  include NumberingResetTypesHelper
  
  before(:each) do
    assigns[:numbering_reset_type] = @numbering_reset_type = stub_model(NumberingResetType,
      :new_record? => false,
      :name => "value for name",
      :script => "value for script"
    )
  end

  it "should render edit form" do
    render "/numbering_reset_types/edit.html.erb"
    
    response.should have_tag("form[action=#{numbering_reset_type_path(@numbering_reset_type)}][method=post]") do
      with_tag('input#numbering_reset_type_name[name=?]', "numbering_reset_type[name]")
      with_tag('textarea#numbering_reset_type_script[name=?]', "numbering_reset_type[script]")
    end
  end
end


