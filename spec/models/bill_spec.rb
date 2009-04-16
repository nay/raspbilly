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
  describe "save" do
    describe "before_save update_total_amount_and_tax" do
      before do
        @bill = Bill.new(:customer_name => "test", :sale_items_attributes => [{:name => "item1", :formatted_amount => "120"}, {:name => "item2", :formatted_amount => "3,000"}])
      end
      it "売上２件の合計が正しいこと" do
        @bill.save!
        @bill.total_amount.should == 3120
        @bill.tax.should == 156
      end
      it "立替が合計され、税金には反映されないこと" do
        @bill.out_of_pocket_items.build(:name => "oop1", :formatted_amount => "5,000")
        @bill.save!
        @bill.total_amount.should == 8120
        @bill.tax.should == 156
      end
    end
  end
end
