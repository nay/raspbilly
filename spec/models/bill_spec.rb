require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Bill do
  describe "update_attributes" do
    it "total_amountは一括で設定できない" do
      b = Bill.new(:total_amount => 1000)
      b.total_amount.should be_nil
    end
    it "taxは一括で設定できない" do
      b = Bill.new(:total_sales_tax => 105)
      b.total_sales_tax.should be_nil
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
  describe "save" do
    describe "before_save update_total_amount_and_tax" do
      before do
        @bill = Bill.new(:customer_name => "test", :sale_items_attributes => [{:name => "item1", :formatted_unit_price => "120", :quantity => "1"}, {:name => "item2", :formatted_unit_price => "3,000", :quantity => "1"}])
      end
      it "売上２件の合計が正しいこと" do
        @bill.save!
        @bill.sale_items.each{|i| p i.inspect }
        @bill.total_sales_amount.should == 3120
        @bill.total_sales_tax.should == 156
      end
      it "立替が合計され、税金には反映されないこと" do
        @bill.out_of_pocket_items.build(:name => "oop1", :formatted_amount => "5,000")
        @bill.save!
        @bill.total_sales_amount.should == 3120
        @bill.total_out_of_pocket_amount.should == 5000
        @bill.total_sales_tax.should == 156
      end
    end
  end
end
