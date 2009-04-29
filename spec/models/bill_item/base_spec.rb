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
  end

end
