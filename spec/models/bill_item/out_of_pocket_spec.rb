require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe BillItem::OutOfPocket do
  describe "update_attributes" do
    it "taxedは一括指定できない" do
      i1 = BillItem::OutOfPocket.new(:taxed => true)
      i2 = BillItem::OutOfPocket.new(:taxed => false)
      i1.taxed?.should == i2.taxed?
    end
  end

  describe "new" do
    it "taxedがfalseになる" do
      i = BillItem::OutOfPocket.new
      i.taxed?.should be_false
    end
  end
  describe "save" do
    it "taxed=trueだと例外を発生する" do
      i = BillItem::OutOfPocket.new
      i.taxed = true
      lambda{i.save}.should raise_error(RuntimeError)
    end
    it "formatted_amount に,付きの数字を渡しても正しくamountに登録される" do
      i = BillItem::OutOfPocket.new(:formatted_amount => "40,000")
      i.save!
      i.formatted_amount.should == "40,000"
      i.amount.should == 40000
    end
  end


end
