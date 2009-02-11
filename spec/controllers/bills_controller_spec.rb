require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe BillsController do

  before do
    @bill = Bill.new(:customer_name => "test")
    @bill.save!
  end


  describe "GET 'index'" do
    it "should be successful" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'new'" do
    it "should be successful" do
      get 'new'
      response.should be_success
    end
  end

  describe "GET 'create'" do
    it "should be successful" do
      get 'create'
      response.should be_success
    end
  end

  describe "PUT 'update'" do
    it "成功する" do
      post 'update', :id => @bill.id, :_method => "put", :bill => {:customer_name => "changed"}
      response.should redirect_to(bills_path)
      @bill.reload
      @bill.customer_name.should == "changed"
    end
  end

  describe "GET 'edit'" do
    it "成功する" do
      get 'edit', :id => @bill.id
      response.should be_success
    end
  end

  describe "DELETE 'destroy'" do
    it "成功する" do
      post 'destroy', :id => @bill.id, :_method => "delete"
      response.should redirect_to(bills_path)
    end
  end
end
