require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/numbering_reset_types/index.html.erb" do
  include NumberingResetTypesHelper
  
  before(:each) do
    assigns[:numbering_reset_types] = [
      stub_model(NumberingResetType,
        :name => "value for name",
        :script => "value for script"
      ),
      stub_model(NumberingResetType,
        :name => "value for name",
        :script => "value for script"
      )
    ]
  end

  it "should render list of numbering_reset_types" do
    render "/numbering_reset_types/index.html.erb"
    response.should have_tag("tr>td", "value for name".to_s, 2)
    response.should have_tag("tr>td", "value for script".to_s, 2)
  end
end

