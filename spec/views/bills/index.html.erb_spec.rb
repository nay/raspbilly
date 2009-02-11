require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/bills/index" do

  it "成功する" do
    assigns[:bills] = []
    render 'bills/index'
    response.should be_success
  end
end
