require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Bill do
  describe "update_attributes" do
    it "total_amountは一括で設定できない" do
      b = Bill.new(:total_amount => 1000)
      b.total_amount.should be_nil
    end
    it "taxは一括で設定できない" do
      b = Bill.new(:tax => 105)
      b.tax.should be_nil
    end
  end
  describe "validate" do
    it "customer_name無しでは検証エラーになる" do
      b = Bill.new
      b.save.should be_false
    end
    it "customer_nameが設定されているときは登録できる" do
      b = Bill.new(:customer_name => "hoge")
      b.save.should be_true
    end
  end
end
