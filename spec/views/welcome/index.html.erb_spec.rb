require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/welcome/index" do
  before(:each) do
    render 'welcome/index'
  end

  it "成功すること" do
    response.should be_success
  end
end
