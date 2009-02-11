require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe BillItem::Base do

  describe "update_attributes" do
    it "bill_idは一括指定できない" do
      i = BillItem::Base.new(:bill_id => 3)
      i.bill_id.should be_nil
    end
    it "parent_idは一括指定できない" do
      i = BillItem::Base.new(:parent_id => 5)
      i.parent_id.should be_nil
    end
    it "amountは一括指定できない" do
      i = BillItem::Base.new(:amount => 5)
      i.amount.should be_nil
    end
  end

  describe "save" do
    it "BillItem::Baseクラスのオブジェクトを保存しようとすると例外が発生する" do
      i = BillItem::Base.new
      lambda{i.save}.should raise_error(RuntimeError)
    end
    it "formatted_amount に,付きの数字を渡しても正しくamountに登録される" do
      i = BillItem::Sale.new(:formatted_amount => "40,000")
      i.save!
      i.formatted_amount.should == "40,000"
      i.amount.should == 40000
    end
  end

end
