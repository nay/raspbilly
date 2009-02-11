require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/bills/edit" do
  before(:each) do
    @bill = Bill.new(:customer_name => "test")
    @bill.save!
  end

  it "成功する" do
    assigns[:bill] = @bill
    render 'bills/edit'
    response.should be_success
  end
end
