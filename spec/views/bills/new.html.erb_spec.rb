require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/bills/new" do
  it "成功する" do
    assigns[:bill] = Bill.new
    render 'bills/new'
    response.should be_success
  end
end
