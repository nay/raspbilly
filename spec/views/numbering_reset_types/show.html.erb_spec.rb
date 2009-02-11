require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/numbering_reset_types/show.html.erb" do
  include NumberingResetTypesHelper
  before(:each) do
    assigns[:numbering_reset_type] = @numbering_reset_type = stub_model(NumberingResetType,
      :name => "value for name",
      :script => "value for script"
    )
  end

  it "should render attributes in <p>" do
    render "/numbering_reset_types/show.html.erb"
    response.should have_text(/value\ for\ name/)
    response.should have_text(/value\ for\ script/)
  end
end

