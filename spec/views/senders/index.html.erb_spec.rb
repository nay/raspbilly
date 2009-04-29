require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/senders/index" do
  before(:each) do
    render 'senders/index'
  end
  it "成功する" do
    response.should be_success
  end
end
